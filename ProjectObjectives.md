![https://awe6.googlecode.com/svn/trunk/docs/images/icons/awe6.png](https://awe6.googlecode.com/svn/trunk/docs/images/icons/awe6.png)

`awe6` is `game` inverted.

Its purpose is to create a scalable, flexible and approachable tool to assist in the rapid development of [quality games](DeveloperGallery.md).  What [types of game](GameGenres.md), and for what type of platform are intentionally undefined to embrace extensibility.

<p align='center'><a href='http://code.google.com/p/awe6/wiki/DeveloperGallery'><img src='https://awe6.googlecode.com/svn/trunk/docs/images/gamesThumbs.jpg' /></a></p>

## What's The "Big Idea"? ##

This framework adopts an entity component approach (rather than a deep heirarchy structure).  For merits of such an approach please read Britt L Hannah's http://devmaster.net/posts/2820/object-oriented-game-design or our [recommended reading list](ReadingList.md).  In short: boundaries removed.  More benefits can be [found here](DeveloperBenefits.md).

All components are created using factory methods, and each component provides further methods to allow injection of child components.  Thus an inversion of control is achieved: a Factory populates components based on starting state (configuration) and subsequent controllers defined within those components (reacting to user input).  A new "game" is defined by a new configuration.  Therefore reuse of modular code is achieved.  Crucially, automated reuse of modular code becomes possible - including runtime adaptation.

The [interface](https://awe6.googlecode.com/svn/tags/api/index.html) has been designed to encourage entities to extend existing libraries whenever possible - awe6 is a framework rather than a games development kit so (with the exception of the [batteries included](ProjectObjectives#Batteries_included.md)) should normally be considered a facade or the "cement between the bricks".

The framework is [open source](http://www.opensource.org/licenses/mit-license.php), while the option for proprietary components is unrestricted.  The adoption and upgrade rates of the framework is benefited by a permissive license, thus expanding the market opportunity for commercial components.

## Batteries Included ##

High level concepts must be balanced by deployable practical tools.  So this framework comes "ready to run" with a shallow heirarchy providing easy access to frequently required services (e.g. user input, assets and audio).  The heirarchy and associated concepts are:

<p align='center'><wiki:gadget url="https://awe6.googlecode.com/svn/trunk/docs/awe6OverviewImagemapGadget.xml?dc=3" border="0" width="800" height="620" /></p>

  * [Factory](ComponentFactory.md): creates all subsequent components based on configuration.
  * [Kernel](ComponentKernel.md): handles updates and services.  The "main loop" in gaming terms.
    * [Preloader](ComponentPreloader.md): loads initial resources.
    * [Assets](ComponentAssets.md): handles access to resources.
    * [Session](ComponentSession.md): maintains and arbitrates state.
    * [Audio](ComponentAudio.md): handles multi-channel music and sounds.
    * [Inputs](ComponentInputs.md): handles UI input: keyboard, mouse, other virtual devices.
    * [Overlay](ComponentOverlay.md): provides application chrome (including: exit, pause, mute controllers) and view.
    * [Scenes](ComponentScene.md): state machine for collections of active Entities.
      * [Entities](ComponentEntity.md): Tree of related and non related components, highly versatile in their purpose.  Additional heirarchy is determined by Factory or Entity design.

The framework uses synchronous state throughout all default components.  So the game could be serialised, paused, rewound or double timed.

## Platform Independence ##

The independent casual game developer / small team represents the target user of awe6.  Currently the primary targets for casual games are the web via Flash / SWF and mobile via iOS / AIR.  It is expected that HTML5, Android & Unity3D will become increasingly relevant targets.

The Next Big Thing comes along too often to develop specifically for it.  Therefore awe6 is a collection of declarative interfaces, intended to be platform agnostic.  For practical purposes there is a working implementation targeting today's Big Things (SWF, HTML5, Android, iOS).

<p align='center'><img src='https://awe6.googlecode.com/svn/trunk/docs/images/platformLogos.png' /></p>

### Approach ###

  1. Cross platform interfaces defining top level game functionality. All public signatures are platform agnostic.
  1. [Haxe](http://www.haxe.org) implementation of all model and controller functionality.  All code runs on supported haxe targets (swf, js, cpp).
  1. Platform specific implementation of view and input functionality using custom driver packages (flash, nme & jeash drivers are included).