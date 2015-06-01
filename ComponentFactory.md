[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/factory.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IFactory.html)

The Factory creates and populates the [Kernel](ComponentKernel.md), all managers and provides answers to runtime configuration requests (like where to go next, or what font a title should be).

## Things you should know about Factory ##

  * [AFactory](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/AFactory.hx) contains almost everything you need out of the tin.  Extend this class, override a few methods and you're running!
  * AFactory takes configuration data (e.g. string, XML etc) and a native application node (e.g. DisplayObject) and builds everything from there using a template pattern.
  * Implements [IFactory](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IFactory.html).

## Did you know? ##

  * `isDecached` can be set false to force reloading of runtime loaded assets - great for testing on network deployments.