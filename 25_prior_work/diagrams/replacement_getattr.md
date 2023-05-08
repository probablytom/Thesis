---
title: Replacement __getattribute__() method
---
```mermaid
flowchart TD
    getattr(Get the attribute of the class that's being resolved\nusing original `getAttribute` method)
    determineType{{Determine whether the attribute is a function/method}}
    notCallable(Return the original attribute)
    ensureNotMagicMethod{{Check attribute name does not indicate a magic method}}
    callableAttr(Build an aspect-woven version of the\ncallable attribute)
    returnWrappedAttr(Return the attribute wrapped\nwithin aspect hookchecking\nand application)

    getattr-->determineType
    determineType-->|Attribute is not a method or a function|notCallable
    determineType-->|Attribute is a method or a function|ensureNotMagicMethod
    ensureNotMagicMethod-->|Attribute is a magic method|notCallable
    ensureNotMagicMethod-->|Attribute is a regular function or method|callableAttr
    callableAttr-->returnWrappedAttr

```