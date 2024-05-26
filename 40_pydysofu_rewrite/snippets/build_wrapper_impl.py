def build_wrapper(target):
    old_target_code = copy.deepcopy(target.__code__)
    class CouldNotFuzzException(Exception):
        pass

    @wraps(target)
    def wrapper(*args, **kwargs):
        pre, around, post, error_handlers, fuzzers = self.get_rules(target.__name__,
                                                                    AspectHooks.manage_ordering)
    
        def reset_code_to_previous():
            if not isinstance(target, FunctionType):
                target.__func__.__code__ = old_target_code
            else:
                target.__code__ = old_target_code

        try:
            # Apply fuzzers
            t = target
            if fuzzers is not None and fuzzers != []:
                cache_key = tuple([str(fuzzer) for fuzzer in fuzzers] + [str(target)])

                if self.cache_fuzz_results and self._cached_fuzzer_applications.get(cache_key):
                    compiled_fuzzed_target = self._cached_fuzzer_applications[cache_key]
                else:
                    code = dedent(inspect.getsource(t))
                    target_ast = ast.parse(code)
                    funcbody_steps = target_ast.body[0].body

                    for fuzzer in fuzzers:
                        non_inline_changed_steps = fuzzer(funcbody_steps, *args, **kwargs)
                        if non_inline_changed_steps:
                            funcbody_steps = non_inline_changed_steps

                    target_ast.body[0].body = funcbody_steps
                    compiled_fuzzed_target = compile(target_ast, "<ast>", "exec")
                    if self.cache_fuzz_results:
                        self._cached_fuzzer_applications[cache_key]=compiled_fuzzed_target

                if not isinstance(t, FunctionType):
                    t.__func__.__code__ =  compiled_fuzzed_target.co_consts[0]
                else:
                    t.__code__ = compiled_fuzzed_target.co_consts[0]

            # Run prelude advice
            [advice(t, *args, **kwargs) for advice in pre]

            # Build a wrapper for the target using around advice
            def nest_around_call(nested_around, next_around):
                return partial(next_around, nested_around)
            nested_around = reduce(nest_around_call,
                                   around[::-1],
                                   self.final_around)
            ret = nested_around(t, *args, **kwargs)
            
            # Run post advice and return the final return value
            for advice in post:
                post_return = advice(t, ret, *args, **kwargs)
                ret = ret if post_return is None else post_return
            reset_code_to_previous()
            return ret

        except Exception as exception:
            reset_code_to_previous()
            prevent_raising = False
            for handler in error_handlers:
                prevent_raising = prevent_raising or handler(t, exception, *args, **kwargs)
            if not prevent_raising:
                raise exception

    return wrapper