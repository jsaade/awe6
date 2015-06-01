[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/messages.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IMessageManager.html)

Entities can communicate directly using invoker methods or indirectly via observer pattern using Messages.  Messages are synchronous, typed signals which some developers may find useful.

## Things you should know about Messages ##

  * [MessageManager](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/MessageManager.hx) comes ready to run (it's automatically composed in [Kernel](ComponentKernel.md)).
  * Any [Entity](ComponentEntity.md) can subscribe to messages from any other Entity (or type of Entity).
  * Messages can be anything, from simple strings to complex types.  Handlers are type safe.
  * Messages are rarely needed as they can be unreliable.  Use [Triggers](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/extras/Trigger.hx) instead.
  * Implements [IMessageManager](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IMessageManager.html).

## Did you know? ##

  * Messages can bubble up, down, or across the entire [Scene](ComponentScene.md), and even automatically self unsubscribe on send.