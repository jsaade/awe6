[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/overlay.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IOverlay.html)

At the very top of the visual pile is the Overlay.  It's the chrome, the border, the panel, the window.  By default the Overlay handles pause, mute and back button functionality.

## Things you should know about Overlay ##

  * [Overlay](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/Overlay.hx) comes ready to run (it's created automatically in the default [Factory](ComponentFactory.md)).
  * The Overlay is always visible.
  * Implements [IOverlay](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IOverlay.html).

## Did you know? ##

  * Additional Overlay buttons can be added by extending [Overlay](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/Overlay.hx) and using [EOverlayButton.SUB\_TYPE](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/EOverlayButton.html).