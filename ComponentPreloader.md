[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/preloader.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IPreloader.html)

All runtime loaded assets must be loaded (at runtime!), the Preloader does this, displays visual updates and proceeds to the next stage in initialisation once completed.

## Things you should know about Preloader ##

  * [APreloader](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/APreloader.hx) comes ready to run (it's created automatically in the default [Factory](ComponentFactory.md)).
  * Preloader automatically loads in assets defined in the config XML file: settings.assets.url1...
  * Any assets used before the Preloader has completed must be compiled into the root application (as they are not yet available).
  * Implements [IPreloader](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IPreloader.html).

## Did you know? ##

  * The default Flash Preloader registers Fonts automatically.