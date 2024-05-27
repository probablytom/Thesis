import joinpointModule

# Only prints "Inside joinPoint" even though aspects were woven into the module
# by moduleA, because joinpointModule was not imported with AspectHooks
# in _this_ module.
def runExample():
    joinpointModule.joinPoint()