def log_invocation(target, *args, **kwargs):
    print(f"Inside prelude before invoking {target.__name__}")