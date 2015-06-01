# Prerequisites #

  * Install [Haxe](http://haxe.org/download).
  * Install awe6 via haxelib tool, by running in the command prompt:

```
haxelib install awe6
```


---


# Windows Operating Systems #

  * Install [FlashDevelop](http://www.flashdevelop.org/wikidocs/index.php?title=Installation).

### Installing awe6 & FlashDevelop project files & templates ###

To install FlashDevelop project files and templates via haxelib tool, run in the command prompt:
```
haxelib run awe6 install
```

### Starting a new awe6 Swf project with FlashDevelop ###

![https://awe6.googlecode.com/svn/trunk/assets/templates/flashDevelop/Projects/313%20Haxe%20-%20awe6%20Swf%20Project/Project.png](https://awe6.googlecode.com/svn/trunk/assets/templates/flashDevelop/Projects/313%20Haxe%20-%20awe6%20Swf%20Project/Project.png)

  * Open FlashDevelop.
  * _Project > New Project > Haxe > awe6 Project_
  * Hit F5 to compile & run.
  * Extend / modify as required.
    * Add new assets via config.xml assets url nodes (as Swfs).
    * Add new Scenes with _Project > Right Click > Add > awe6 > New Scene_
    * Add new Entities with _Project > Right Click > Add > awe6 > New Entity_

### Starting a new awe6 OpenFL project with FlashDevelop ###

![https://awe6.googlecode.com/svn/trunk/assets/templates/flashDevelop/Projects/373%20Haxe%20-%20awe6%20OpenFL%20Project/Project.png](https://awe6.googlecode.com/svn/trunk/assets/templates/flashDevelop/Projects/373%20Haxe%20-%20awe6%20OpenFL%20Project/Project.png)

  * Open FlashDevelop.
  * _Project > New Project > Haxe > awe6 OpenFL Project_
  * Select your target from the top pull down menu.
  * Hit F5 to compile & run.
    * Alternatively use command `openfl test flash`
  * Extend / modify as required.
    * Add new assets via the OpenFL project xml file.
    * Add new Scenes with _Project > Right Click > Add > awe6 > New Scene_
    * Add new Entities with _Project > Right Click > Add > awe6 > New Entity_

### Starting a new awe6 CreateJS project with FlashDevelop ###

![https://awe6.googlecode.com/svn/trunk/assets/templates/flashDevelop/Projects/374%20Haxe%20-%20awe6%20CreateJS%20Project/Project.png](https://awe6.googlecode.com/svn/trunk/assets/templates/flashDevelop/Projects/374%20Haxe%20-%20awe6%20CreateJS%20Project/Project.png)

  * Open FlashDevelop.
  * _Project > New Project > Haxe > awe6 CreateJS Project_
  * Hit F5 to compile & run (a webserver will launch).
  * Extend / modify as required.
    * Add new assets to bin/assets (automatically added to preloader).
    * Add new Scenes with _Project > Right Click > Add > awe6 > New Scene_
    * Add new Entities with _Project > Right Click > Add > awe6 > New Entity_


---


# Mac or Linux Operating Systems #

  * Choose a [Haxe IDE](http://haxe.org/com/ide)

### Starting a new project with awe6 ###

  * Create an awe6 Swf project:

```
haxelib run awe6 create project swf <projectname> <packagename> <author>
```

  * Create an awe6 OpenFL project:

```
haxelib run awe6 create project openfl <projectname> <packagename> <author>
```

  * Create an awe6 CreateJS project:

```
haxelib run awe6 create project createjs <projectname> <packagename> <author>
```

  * Add new Scenes with:

```
haxelib run awe6 create scene <projectname> <packagename> <author>
```

  * Add new Entities with:

```
haxelib run awe6 create entity <projectname> <packagename> <author>
```


---


# Next Steps #

  * See ExampleHelloWorld.
  * Read Game From Scratch's [tutorial](http://www.gamefromscratch.com/post/2013/05/14/A-closer-look-at-the-Awe6-Haxe-game-engine.aspx).
  * Create a new project using the templates explained above.
  * See more detailed platform specific demos [/trunk/demos/](http://code.google.com/p/awe6/source/browse/#svn%2Ftrunk%2Fdemos%2F).
  * Ask questions in the [awe6 Google group](http://groups.google.com/group/awe6) - all questions welcomed, we respond fast.