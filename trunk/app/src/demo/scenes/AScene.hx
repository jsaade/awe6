/*
 * Copyright (c) 2010, Robert Fell, awe6.org
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package demo.scenes;
import flash.display.BitmapData;
#if flash
import assets.Background;
#end
import awe6.core.Scene;
import awe6.extras.gui.Image;
import awe6.extras.gui.Text;
import awe6.interfaces.EAudioChannel;
import awe6.interfaces.EScene;
import awe6.interfaces.IKernel;
import demo.Session;
import flash.display.Bitmap;

class AScene extends Scene
{
	private var _session:Session;
	private var _title:String;
	private var _titleText:Text;
	private var _isMusic:Bool;
	
	private function new( kernel:IKernel, type:EScene, ?isPauseable:Bool = false, ?isMutable:Bool = true, ?isSessionSavedOnNext:Bool = false ) 
	{
		_session = cast kernel.session;
		_title = "?";
		super( kernel, type, isPauseable, isMutable, isSessionSavedOnNext );
	}
	
	override private function _init():Void 
	{
		super._init();
		
		var l_background:BitmapData;
		#if flash
		l_background = new Background();
		#elseif js
		var l_folder:String = "../../assetsDeployed/demo/gui/LIBRARY/";
		l_background = _getBitmapData( l_folder + "scenes/Background.png", 600, 400 );
		#end
		addEntity( new Image( _kernel, l_background ), true, 0 );
		var l_sceneID:String = _tools.toCamelCase( Std.string( type ), true );
		_title = Std.string( _kernel.getConfig( "gui.scenes." + l_sceneID + ".title" ) );
		_titleText = new Text( _kernel, _kernel.factory.width, 50, _title, _kernel.factory.createTextStyle() );
		_titleText.y = 10;
		addEntity( _titleText, true, 100 );
		
		_kernel.audio.start( "MusicMenu", EAudioChannel.MUSIC, -1, 0, .125, 0, true );
	}
	
	#if js
	private function _getBitmapData( id:String, ?width:Int = 40, ?height:Int = 28 ):flash.display.BitmapData
	{
		var l_result:flash.display.BitmapData = new flash.display.BitmapData( width, height, true );
		l_result.LoadFromFile( id, flash.display.LoaderInfo.create( null ) );
		return l_result;
	}
	#end
	
	
}