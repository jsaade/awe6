[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/inputs.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IInputManager.html)

User input comes in many forms, and this component handles them and provides an easy unified interface to their state: mouse, keyboard, virtual joypad.

## Things you should know about Inputs ##

  * [InputManager](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/InputManager.hx) comes ready to run with working implementations for Mouse, Keyboard and virtual Joypads.  Multitouch support coming soon.
  * Inputs are state based, rather than event based - so code queries the current state of a button, key, position etc.  Use [Trigger](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/extras/Trigger.hx) + [Messages](ComponentMessages.md) if you want to "listen".
  * Implements [IInputManager](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IInputManager.html).

## Did you know? ##

  * Unlimited virtual Joypads can be created and run concurrently - e.g. for multiplayer games.