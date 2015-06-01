[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/kernel.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IKernel.html)

The Kernel is the central component for the awe6 framework.  It contains access to the Managers and keeps the engine ticking.  The Kernel is the "main loop" and updates all other components on a per frame / interval basis.

## Things you should know about Kernel ##

  * [Kernel](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/Kernel.hx) comes ready to run - you shouldn't need to edit it, extend it or compose it (it's automatically composed in the default [Factory](ComponentFactory.md)).
  * Can be used as a service locator - a single point of reference to the other managers.  If you like that sort of thing:
    * Constructor inject only the sub components you need (good).
    * Or constructor inject full Kernel from class to class "tramp" (bad).
    * Or throw good sense out the window and go global! Use a static reference (i.e. a Singleton) to it from your Factory (ugly).
  * Implements [IKernel](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IKernel.html).

## Did you know? ##

  * `isDebug` can be used to write conditional code in your classes to improve building or testing efficiency.