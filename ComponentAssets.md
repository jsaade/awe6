[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/assets.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IAssetManager.html)

Assets, assets, assets.  Every project has them: graphics, sounds, music, movies, 3D meshes, fonts.  Assets are the external binaries which provide the fluff to the crunch.

The AssetManager provides a (potentially) type safe route to any asset, of any type, for any target.  Therefore it is somewhat abstract, and arguably useless in it's default form.

## Things you should know about Assets ##

  * No two projects are the same.  So it is safe to assume that because assets are concrete, reference to them should be too.
    * Consider extending [AAssetManager](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/AAssetManager.hx) for your project to include factory methods for each asset - and inject Entities with their required assets from Factory (good).
    * Or cast IKernel.assets in situations as they arise - e.g. [Scene](ComponentScene.md) or [Entity](ComponentEntity.md) (bad).
    * Or use string keys and identifiers to reference assets at runtime (ugly).
  * Perhaps a good asset manager is also a [Preloader](ComponentPreloader.md) - when creating these concrete implementations consider their union.
  * Implements [IAssetManager](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IAssetManager.html).

## Did you know? ##

  * Typed assets (e.g. via haXe generate intrinsics) allows compile time safe querying of any asset which reduces runtime errors significantly.