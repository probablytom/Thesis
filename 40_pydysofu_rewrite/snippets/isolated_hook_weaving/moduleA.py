from pdsf import AspectHooks
import aspects
with AspectHooks():
    import joinpointModule

# Prints "Inside prelude before invoking joinPoint", then "Inside joinPoint".
# The first line is printed by the prelude advice woven using AspectHooks.
def runExample():
    AspectHooks.add_prelude(aspects.log_invocation, 'joinPoint')
    joinpointModule.joinPoint()