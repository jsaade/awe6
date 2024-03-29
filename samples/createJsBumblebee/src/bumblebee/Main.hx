package bumblebee;
import awe6.core.Context;
import createjs.easeljs.Stage;
import haxe.Resource;
import js.Browser;

/**
 * ...
 * @author valerie.elimak - blog.elimak.com
 */

class Main 
{	
	static function main() 
	{
		#if debug
		var l_isDebug:Bool = true;
		#else
		var l_isDebug:Bool = false;
		#end
        var l_stage = new Stage( cast Browser.document.getElementById( "gameCanvas" ) );
		var l_context = new Context();
		l_stage.addChild( l_context );
		var l_factory = new Factory( l_context, l_isDebug, Resource.getString( "config" ) );
	}
	
	public function new() 
	{
		// needed for good form
	}
	
}
