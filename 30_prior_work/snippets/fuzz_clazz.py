def weave_clazz(clazz, advice):
    """
    :param clazz : the class to weave.
    :param advice : the dictionary of method reference->aspect mappings to apply for the class.
    """
    if clazz not in _reference_get_attributes:
        _reference_get_attributes[clazz] = clazz.__getattribute__

    if clazz in advice_cache:
        advice_cache[clazz].update(advice)
    else:
        advice_cache[clazz] = advice

    def __weaved_getattribute__(self, item):
        attribute = object.__getattribute__(self, item)
        if item[0:2] == '__':
            return attribute
        elif inspect.isfunction(attribute) or inspect.ismethod(attribute):
            def wrap(*args, **kwargs):
                advice = advice_cache[clazz]
                reference_function = attribute
                advice_key = reference_function

                if inspect.ismethod(attribute):
                    reference_function = attribute.im_func
                    advice_key = getattr(attribute.im_class, attribute.func_name)

                aspect = advice.get(advice_key, identity)
                try:
                    if hasattr(aspect, 'prelude'):
                        aspect.prelude(attribute, self, *args, **kwargs)

                    if hasattr(aspect, 'around'):
                        result = aspect.around(attribute, self, *args, **kwargs)
                    else:
                        func_args = args
                        if inspect.ismethod(attribute):
                            func_args = (self,) + args

                        result = reference_function(*func_args, **kwargs)

                    if hasattr(aspect, 'encore'):
                        aspect.encore(attribute, self, result)

                    return result
                except Exception as exception:
                    if hasattr(aspect, 'error_handling'):
                        return aspect.error_handling(attribute, self, exception)
                    else:
                        raise exception

            wrap.func_name = attribute.func_name
            wrap.func_dict = attribute.func_dict
            return wrap
        else:
            return attribute
    clazz.__getattribute__ = __weaved_getattribute__