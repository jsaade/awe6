[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/scene.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IScene.html)

One Scene leads to another.  A game is composed from multiple Scenes - e.g.: Intro, Menu, Game, Results etc.  Each Scene contains it's own [Entities](ComponentEntity.md) who's interaction may lead to the scene changing (e.g. if the game is won).

## Things you should know about Scene ##

  * [Scene](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/Scene.hx) comes ready to run - inject [Entities](ComponentEntity.md) into it, or extend as required.
  * A Scene can contain [Entities](ComponentEntity.md).
  * A Scene has a [View](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IView.html), which forms the main visible display underneath the [Overlay](ComponentOverlay.md).
  * When the Scene changes it will trigger a new [ISceneTransition](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/ISceneTransition.html), creating a smooth visual change from one to the next.  The default [Factory](ComponentFactory.md) includes a simple fade [SceneTransition](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/SceneTransition.hx).
  * Implements [IScene](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IScene.html).

## Did you know? ##

  * Each Scene self determines whether the [Overlay](ComponentOverlay.md) displays pause or mute options.