# Hello World Example #

This is a simple Flash target example.

Main.hx
```
package ;
import awe6.extras.gui.Text;
import awe6.Types;
import flash.Lib;

class Main 
{	
	static function main() 
	{
		var l_config = '<?xml version="1.0" encoding="utf-8"?><data><message>Hello World!</message></data>';
		new Factory( Lib.current, false, l_config ); 
	}	
}

class Factory extends AFactory
{
	override public function createScene( p_type:EScene ):IScene 
	{
		var l_scene = new Scene( _kernel, p_type );
		l_scene.addEntity( new Text( _kernel, width, height, _kernel.getConfig( "message" ) ), true );
		return l_scene;
	}
}
```

And compile with HelloWorld.hxml
```
-lib awe6
-swf-header 600:400:25:FFFFFF
-swf-version 10
-swf awe6.swf
-main Main
-cmd awe6.swf
```

Result will be a 600x400 white swf with "Hello World!" written in sans serif font top left corner.

To do more, override more methods of AFactory ... see our FlashDevelop template files (or Mac/Linux haxelib run script) for an example which includes multiple scenes, asset manager and custom overlay.