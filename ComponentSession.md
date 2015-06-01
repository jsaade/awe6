[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/session.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/ISession.html)

When gameplay experience requires some stateful persistence - e.g. when returning to the game, or even between [Scenes](ComponentScene.md) the Session can be used to store the game state.

As all games are different, and all state persitence requirements different the default implementation of Session is somewhat abstract, and therefore arguably of limited use.

## Things you should know about Session ##

  * [ASession](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/ASession.hx) comes ready to run (it's created automatically in the default [Factory](ComponentFactory.md)).
  * Session automatically saves game state to a SharedObject.
  * Session is the unspoken evil of application design - somewhere arbitration must exist, somewhere concrete values must be retained.  Therefore assume each project should extend ASession for its own requirements:
    * Inject Session properties into Scenes from within Factory (good).
    * Or cast IKernel.session in situations as they arise - e.g. [Scene](ComponentScene.md) or [Entity](ComponentEntity.md) (bad).
    * Or throw good sense out the window and go global! Access via a Static and use dynamics or untyped to turn Session into a true Global (ugly).
  * Implements [ISession](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/ISession.html).

## Did you know? ##

  * [ASession](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/ASession.hx) can store multiple user sessions, stored by id.