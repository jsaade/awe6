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

package awe6.core;
import awe6.interfaces.EMouseButton;
import awe6.interfaces.IInputMouse;
import awe6.interfaces.IKernel;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.Stage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.Lib;
import flash.utils.ByteArray;

/**
 * The InputMouse class provides a minimalist implementation of the IInputMouse interface.
 * <p>For API documentation please review the corresponding Interfaces.</p>
 * @author	Robert Fell
 */
class InputMouse extends Process, implements IInputMouse
{
	public var x( default, null ):Int;
	public var y( default, null ):Int;
	public var deltaX( default, null ):Int;
	public var deltaY( default, null ):Int;
	public var relativeX( default, null ):Float;
	public var relativeY( default, null ):Float;
	public var relativeCentralisedX( default, null ):Float;
	public var relativeCentralisedY( default, null ):Float;
	public var isWithinScreenBounds( default, null ):Bool;
	public var isMoving( default, null ):Bool;	
	public var scroll( default, null ):Int;
	public var deltaScroll( default, null ):Int;
	
	private var _stage:Stage;
	private var _buffer:Array<Bool>;
	private var _xPrev:Int;
	private var _yPrev:Int;
	private var _scrollPrev:Int;
	private var _stillUpdates:Int;
	private var _stillDuration:Int;
	private var _buttonLeft:_HelperButton;
	private var _buttonMiddle:_HelperButton;
	private var _buttonRight:_HelperButton;
	private var _mouseClicks:Loader;
	
	override private function _init():Void 
	{
		super._init();
		_stage = Lib.current.stage;
		x = y = deltaX = deltaY = scroll = deltaScroll = 0;
		relativeX = relativeY = relativeCentralisedX = relativeCentralisedY = 0;
		isMoving = false;		
		_buffer = [];
		x = Math.round( _stage.mouseX );
		y = Math.round( _stage.mouseY );
		isMoving = false;
		scroll = 0;
		deltaScroll = 0;
		_scrollPrev = 0;
		_stillUpdates = 0;
		_stillDuration = 0;
		_stage.addEventListener( MouseEvent.MOUSE_DOWN, _onMouseDown );
		_stage.addEventListener( MouseEvent.MOUSE_UP, _onMouseUp );
		_stage.addEventListener( MouseEvent.MOUSE_WHEEL, _onMouseWheel );
		_stage.addEventListener( Event.DEACTIVATE, _reset );
		
		#if flash
		_mouseClicks = new Loader();
//		_mouseClicks.load( new URLRequest( "mouseClicks.swf" ) );
//		_mouseClicks.contentLoaderInfo.addEventListener( Event.COMPLETE, _onComplete );
		var l_data:String = "4657530a7901000060003e80003e80001801004411000000004302ffffff3f031e010000885f0009002a00536563757269747900616c6c6f77496e736563757265446f6d61696e00616c6c6f77446f6d61696e006d6f757365427574746f6e730041536e6174697665006f6e456e7465724672616d65005f7769647468005f686569676874009609000800070100000008011c960200080252179609000800070100000008011c96020008035217961300080407020000000720030000070200000008053d3c96020008068e0800000000026a006a00960c000702000000070100000008043d129d020012009609000401080707320000004f9902000d009609000401080707640000004f960c000704000000070100000008043d129d020012009609000401080807320000004f9902000d009609000401080807640000004f1d00bf0025000000010060003e80003e80010000000001140000000011158fa0fa1e8830e9830e87d0e97d0000860606010001000040000000";
		var l_bytes:ByteArray = _tools.hexToBytes( l_data );
		_mouseClicks.loadBytes( l_bytes );
		#end
		_reset();
	}
	
	private function _onComplete( event:Event ):Void
	{
		cast( event.target, LoaderInfo ).removeEventListener( Event.COMPLETE, _onComplete );
//		var l_bytes:ByteArray = cast( event.target, LoaderInfo ).bytes;
//		trace( _toHex( l_bytes ) );
	}
	
	inline private function _isMiddleDown():Bool { return _mouseClicks.height == 50; }
	inline private function _isRightDown():Bool { return _mouseClicks.width == 50; }
	
	override private function _updater( ?deltaTime:Int = 0 ):Void 
	{
		super._updater( deltaTime );
		
		_handleButton( EMouseButton.LEFT, _buffer.length > 0 ? _buffer.shift() : _buttonLeft.isDown, deltaTime );
		#if flash
		_handleButton( EMouseButton.MIDDLE, _isMiddleDown(), deltaTime );
		_handleButton( EMouseButton.RIGHT, _isRightDown(), deltaTime );
		#end
		
		deltaScroll = scroll - _scrollPrev;
		_scrollPrev = scroll;

		_xPrev = x;
		_yPrev = y;
		x = Std.int( _tools.limit( _stage.mouseX, 0, _kernel.factory.width ) );
		y = Std.int( _tools.limit( _stage.mouseY, 0, _kernel.factory.height ) );
		deltaX = x - _xPrev;
		deltaY = y - _yPrev;
		isMoving = ( ( x != _xPrev ) || ( y != _yPrev ) );
		if ( isMoving )
		{
			_stillUpdates = _stillDuration = 0;
		}
		else
		{
			_stillUpdates++;
			_stillDuration += deltaTime;
		}
		relativeX = x / _kernel.factory.width;
		relativeY = y / _kernel.factory.height;
		relativeCentralisedX = ( relativeX - .5 ) * 2;
		relativeCentralisedY = ( relativeY - .5 ) * 2;
		isWithinScreenBounds = ( _stage.mouseX >= 0 ) && ( _stage.mouseX <= _kernel.factory.width ) && ( _stage.mouseY >= 0 ) && ( _stage.mouseY <= _kernel.factory.height );
		
//		trace( _buttonLeft.timeUpPrevious + ":" + _buttonMiddle.timeUpPrevious + ":" + _buttonRight.timeUpPrevious );
	}
	
	private function _handleButton( ?type:EMouseButton, isDown:Bool, ?deltaTime:Int = 0 ):Void
	{
		var l_button:_HelperButton = _getButton( type );
		if ( isDown )
		{
			if ( !l_button.isDown )
			{
				l_button.timeUpPrevious = l_button.timeUp;
				l_button.updatesUpPrevious = l_button.updatesUp;
				l_button.timeUp = l_button.updatesUp = 0;
				l_button.clickX = Std.int( _stage.mouseX );
				l_button.clickY = Std.int( _stage.mouseY );
			}
			l_button.timeDown += deltaTime; 
			l_button.updatesDown++;
			l_button.isDown = true;
		}
		else
		{
			if ( l_button.isDown )
			{
				l_button.timeDownPrevious = l_button.timeDown;
				l_button.updatesDownPrevious = l_button.updatesDown;
				l_button.timeDown = l_button.updatesDown = 0;
			}
			l_button.timeUp += deltaTime; 
			l_button.updatesUp++;
			l_button.isDown = false;	
		}
	}
	
	override private function _disposer():Void 
	{
		_stage.removeEventListener( MouseEvent.MOUSE_DOWN, _onMouseDown );
		_stage.removeEventListener( MouseEvent.MOUSE_UP, _onMouseUp );
		_stage.removeEventListener( MouseEvent.MOUSE_WHEEL, _onMouseWheel );
		_stage.removeEventListener( Event.DEACTIVATE, _reset );
		super._disposer();		
	}
	
	private function _onMouseDown( event:MouseEvent ):Void
	{
		if ( !isActive ) return;
		_buffer.push( true );
	}
	
	private function _onMouseUp( event:MouseEvent ):Void
	{
		if ( !isActive ) return;
		_buffer.push( false );
	}
	
	private function _onMouseWheel( event:MouseEvent ):Void
	{
		if ( !isActive ) return;
		scroll += event.delta;
	}
	
	private function _reset( ?event:Event = null ):Void
	{
		_buffer = [];
		_buttonLeft = new _HelperButton( _kernel );
		_buttonMiddle = new _HelperButton( _kernel );
		_buttonRight = new _HelperButton( _kernel );
	}
	
	private function _getButton( ?type:EMouseButton ):_HelperButton
	{
		if ( type == null ) type = LEFT;
		return switch ( type )
		{
			case LEFT : _buttonLeft;
			case MIDDLE : _buttonMiddle;
			case RIGHT : _buttonRight;
		}
	}
	
	public function getIsButtonDoubleClick( ?type:EMouseButton, ?delay:Int = 100 ):Bool
	{
		var l_button:_HelperButton = _getButton( type );
		return l_button.isDown ? ( l_button.timeUpPrevious <= delay ) : false;
	}
	
	public function getIsButtonDrag( ?type:EMouseButton, ?delay:Int = 100 ):Bool
	{
		var l_button:_HelperButton = _getButton( type );
		return l_button.isDown ? l_button.timeDown > delay : false;
	}	
	
	public function getStillCount( ?asTime:Bool = true ):Int
	{
		return asTime ? _stillDuration : _stillUpdates;
	}
	
	public function getIsButtonDown( ?type:EMouseButton ):Bool
	{
		var l_button:_HelperButton = _getButton( type );
		return l_button.isDown;
	}
	
	public function getIsButtonPress( ?type:EMouseButton ):Bool
	{
		var l_button:_HelperButton = _getButton( type );
		return l_button.updatesDown == 1;		
	}
	
	public function getIsButtonRelease( ?type:EMouseButton ):Bool
	{
		var l_button:_HelperButton = _getButton( type );
		return l_button.updatesUp == 1;		
	}
	
	public function getButtonDownDuration( ?type:EMouseButton, ?asTime:Bool = true, ?isPrevious:Bool = false ):Float
	{
		var l_button:_HelperButton = _getButton( type );
		if ( isPrevious ) return asTime ? l_button.timeDownPrevious : l_button.updatesDownPrevious;
		return asTime ? l_button.timeDown : l_button.updatesDown;
	}
	
	public function getButtonUpDuration( ?type:EMouseButton, ?asTime:Bool = true, ?isPrevious:Bool = false  ):Float
	{
		var l_button:_HelperButton = _getButton( type );
		if ( isPrevious ) return asTime ? l_button.timeUpPrevious : l_button.updatesUpPrevious;
		return asTime ? l_button.timeUp : l_button.updatesUp;
	}
	
	public function getButtonDragWidth( ?type:EMouseButton ):Int
	{
		var l_button:_HelperButton = _getButton( type );
		return l_button.isDown ? x - l_button.clickX : 0;
	}
	
	public function getButtonDragHeight( ?type:EMouseButton ):Int
	{
		var l_button:_HelperButton = _getButton( type );
		return l_button.isDown ? y - l_button.clickY : 0;
	}
	
	public function getButtonLastClickedX( ?type:EMouseButton ):Int
	{
		var l_button:_HelperButton = _getButton( type );
		return l_button.clickX;
	}
	
	public function getButtonLastClickedY( ?type:EMouseButton ):Int
	{
		var l_button:_HelperButton = _getButton( type );
		return l_button.clickY;
	}
	
}

private class _HelperButton
{
	public var isDown:Bool;
	public var updatesDown:Int;
	public var updatesUp:Int;
	public var timeDown:Int;
	public var timeUp:Int;
	public var updatesDownPrevious:Int;
	public var updatesUpPrevious:Int;
	public var timeDownPrevious:Int;
	public var timeUpPrevious:Int;
	public var clickX:Int;
	public var clickY:Int;
	
	public function new( kernel:IKernel )
	{
		isDown = false;
		updatesDown = 0;
		updatesUp = kernel.tools.BIG_NUMBER;
		timeDown = 0;
		timeUp = kernel.tools.BIG_NUMBER;
		updatesDownPrevious = 0;
		updatesUpPrevious = kernel.tools.BIG_NUMBER;
		timeDownPrevious = 0;
		timeUpPrevious = kernel.tools.BIG_NUMBER;
	}
}