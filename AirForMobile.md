![https://awe6.googlecode.com/svn/trunk/docs/images/IosMockup.jpg](https://awe6.googlecode.com/svn/trunk/docs/images/IosMockup.jpg)

You can readily deploy your awe6 powered games to multiple mobile devices (e.g. iOS, Android).  There are various approaches, each with its respective pros and cons.  Please note the author of awe6 is a fan of SWF & HTML5 as they represent ubiquitous platforms (today and tomorrow respectively) and there are many HTML5 accelerators now available in this space, some running as default in modern browsers.

## OpenFL ##

[OpenFL](http://openfl.org) is a Haxe homegrown solution to deploying multimedia natively to devices.  The library wraps lower level libraries  into a familiar Flash like API.

To use awe6 with your OpenFL project add the following line to your OpenFL project's xml file:

```
<haxelib name="awe6" />
```

Alternatively create a new awe6 OpenFL project using the templates included in the haxelib installation.  See QuickStart for more information.

Please note many subtle variances currently exist between the OpenFL and Flash APIs so code methodically and consider fallbacks.  Specifically avoid frequent draw(), masks, filters, negative matrix transformations or complex Sounds.  The other drawback of a native approach is that existing ActionScript libraries may not be available to your project.

To deploy to iOS a Mac is required.

## Adobe AIR ##

Converts any SWF to a mobile app.  The majority of the Flash API is available and works generally as expected.  Conventional DisplayList usage can be slow, so use of flash.display.Bitmap (which has been optimised for use with mobile devices) is a basic requirement.  Using GPU specific libraries (e.g. Starling or Away3D) is also increasingly effective.

Follow these steps to target your game to Web via awe6 + Flash Player, iPhone, iPod, iPad, Android via awe6 + AIR:

  1. Install [AIR SDK (2.7+)](http://www.adobe.com/products/air/sdk/).
  1. Follow the [Quick Start Tutorial](QuickStart.md) and build an awe6 application.
  1. Compile your application using compiler flag `-D awe6Air` (this disables some minor incompatible aspects within the flash driver).
  1. iOS: Build the generated swf into an AIR app using [Adobe's Help](http://help.adobe.com/en_US/air/build/WSfffb011ac560372f3cb56e2a12cc36970aa-8000.html).
  1. Android: Build the generated swf into an AIR app using [Adobe's Help](http://help.adobe.com/en_US/air/build/WS901d38e593cd1bac25d3d8c712b2d86751e-8000.html).

Note: deployment to iOS requires a valid membership of the Apple Developer iOS program.  Certificate creation and application packaging can be done from either a Mac or Windows following [these steps](http://www.adobe.com/devnet/air/articles/packaging-air-apps-ios.html).  Final push to iTunes requires a Mac (perhaps borrow a friend's, if you don't own one?).

## Mobile Web / HTML5 ##

Run mobile games directly in the browser using HTML5.  Games can even be saved to the home-screen (using AppCache) to give the "app" experience.  Benefits include no delays in App Store approval, no privacy concerns, easy social media integration.  Various monetization and advertising revenue options now exist.

To make a game with awe6 that targets HTML5 use either OpenFL-html5 or the CreateJS driver and template provided in awe6 version 2.3+.