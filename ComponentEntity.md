[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/entity.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IEntity.html)

Games are made from Entitites, which can live in other Entities, top level [Scenes](ComponentScene.md) or in the void.  Entities are "where the action's at"!

Entities can provide simple functionality such as being a property holder or value object, they can contain logic or invokers, or they can wrap other libraries.  An Entity could even contain an entirely new [Factory](ComponentFactory.md)!

## Things you should know about Entity ##

  * [Entity](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/Entity.hx) comes ready to run - inject behavior into it, or extend as required.
  * An Entity can contain child Entities.
  * Each child can be bound to an [EAgenda](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/EAgenda.html).
  * An Entity's agenda can be changed, and only the child Entities bound to that agenda will be visible or update.  Agenda is the Entity's State Machine.
  * Child entities can be retrieved by id or more importantly type, therefore creating an entity component framework.
  * Each Entity has a single [View](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IView.html), which can be attached to another View (or not).
  * Implements [IEntity](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IEntity.html).

## Did you know? ##

  * Using `getEntitiesByClass` allows almost infinitely adaptable access to any group of Entities in the current [Scene](ComponentScene.md).  Whilst remaining 100% type safe!