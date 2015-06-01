[![](https://awe6.googlecode.com/svn/trunk/docs/images/icons/audio.png)](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IAudioManager.html)

Sounds and music over multiple channels are handled by the AudioManager.  It provides a centralised manager to start, stop or transform audio.

## Things you should know about Audio ##

  * [AudioManager](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/core/AudioManager.hx) comes ready to run (it's automatically composed in [Kernel](ComponentKernel.md)).
  * Any sound must be an [Asset](ComponentAssets.md) referenced by unique key.
  * [AudioChannels](https://code.google.com/p/awe6/source/browse/trunk/app/src/awe6/interfaces/EAudioChannel.hx) allow discrete control or transformation of multiple sounds.
  * Implements [IAudioManager](https://awe6.googlecode.com/svn/tags/api/types/awe6/interfaces/IAudioManager.html).

## Did you know? ##

  * Using an `EAudioChannel.SUB_TYPE( this )` allows any other class easy access to it's own, unique, channel.