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
import awe6.interfaces.IAssetManager;
import awe6.interfaces.IAudioManager;
import awe6.interfaces.IFactory;
import awe6.interfaces.IInputManager;
import awe6.interfaces.IKernel;
import awe6.interfaces.ILogger;
import awe6.interfaces.IMessageManager;
import awe6.interfaces.IOverlay;
import awe6.interfaces.IPreloader;
import awe6.interfaces.IProcess;
import awe6.interfaces.ISceneManager;
import awe6.interfaces.ISession;
import awe6.interfaces.ITools;
import flash.display.Sprite;
import flash.display.Stage;
import flash.display.StageDisplayState;
import flash.display.StageQuality;
import flash.display.StageScaleMode;
import flash.events.ContextMenuEvent;
import flash.events.Event;
import flash.events.FullScreenEvent;
import flash.geom.Rectangle;
import flash.Lib;
import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;

/**
 * The Kernel class provides a minimalist implementation of the IKernel interface.
 * <p>For API documentation please review the corresponding Interfaces.</p>
 * @author	Robert Fell
 */
class Kernel extends Process, implements IKernel
{
	private static inline var _POWERED_BY = "Powered by awe6";
	private static inline var _RELEASE_CAUTION = "PUBLIC RELEASE NOT ADVISED";
	private static inline var _RESET_SESSIONS = "Reset All Saved Information";
	private static inline var _EYE_CANDY_ENABLE = "Enable Eye Candy";
	private static inline var _EYE_CANDY_DISABLE = "Disable Eye Candy";
	private static inline var _FULL_SCREEN_ENABLE = "Enter Full Screen Mode";
	private static inline var _FULL_SCREEN_DISABLE = "Exit Full Screen Mode";
	
	// instance properties
	public var overlay( default, null ):IOverlay;
	public var factory( default, null ):IFactory;
	public var isDebug( default, null ):Bool;
	public var isLocal( default, null ):Bool;
	public var isEyeCandy( default, __set_isEyeCandy ):Bool;
	public var isFullScreen( default, __set_isFullScreen ):Bool;
	public var tools( default, null ):ITools;
	public var assets( default, null ):IAssetManager;
	public var audio( default, null ):IAudioManager;
	public var inputs( default, null ):IInputManager;
	public var scenes( default, null ):ISceneManager;
	public var messenger( default, null ):IMessageManager;
	public var session:ISession;	
	
	// internal mechanics
	private var _stage:Stage;
	private var _view:View;
	private var _assetManager:AssetManager;
	private var _audioManager:AudioManager;
	private var _inputManager:InputManager;
	private var _sceneManager:SceneManager;
	private var _messageManager:MessageManager;
	private var _logger:ILogger;
	private var _isPreloaded:Bool;
	private var _preloader:IPreloader;
	private var _profiler:Profiler;
	private var _processes:List<IProcess>;
	private var _helperFramerate:_HelperFramerate;
	private var _eyeCandyEnableContextMenuItem:ContextMenuItem;
	private var _eyeCandyDisableContextMenuItem:ContextMenuItem;
	private var _fullScreenEnableContextMenuItem:ContextMenuItem;
	private var _fullScreenDisableContextMenuItem:ContextMenuItem;

	public function new( factory:IFactory, sprite:Sprite )
	{
		this.factory = factory;
		tools = _tools = new Tools( this );
		_view = new View( this, sprite );
		_stage = sprite.stage;
		super( this );
	}
	
	override private function _init():Void
	{
		super._init();
		isDebug = factory.isDebug;
		isLocal = !( _stage.loaderInfo.url.indexOf( "file:" ) == -1 );
		_isPreloaded = false;
		_processes = new List<IProcess>();
		_helperFramerate = new _HelperFramerate( factory.targetFramerate );
		assets = _assetManager = new AssetManager( _kernel );
		audio =	_audioManager = new AudioManager( _kernel );
		inputs = _inputManager = new InputManager( _kernel );
		scenes = _sceneManager = new SceneManager( _kernel );
		messenger = _messageManager = new MessageManager( _kernel );
		_view.addChild( _sceneManager.view );
		_addProcess( _assetManager );
		_addProcess( _audioManager );
		_addProcess( _inputManager );
		_addProcess( _sceneManager );
		_addProcess( _messageManager );
		factory.create( this );
		_nativeInit();
		session = factory.createSession( ASession.DEBUG_ID );
		session.reset();
		_preloader = factory.createPreloader();
		_addProcess( _preloader );
		_view.addChild( _preloader.view );
		_addProcess( _view );
	}	
	
	public function onPreloaderComplete( preloader:IPreloader ):Void
	{
		_isPreloaded = true;
		_removeProcess( _preloader );
		_preloader = null;
		_logger = factory.createLogger();
		overlay = factory.createOverlay();
		_addProcess( overlay, false );
		_view.addChild( overlay.view );
		scenes.setScene( factory.startingSceneType );
		if ( isDebug ) _view.addChild( new View( this, new Profiler(), _tools.BIG_NUMBER ) );
	}
	
	private function _nativeInit():Void
	{
		var l_instance:Kernel = this;
		Lib.current.focusRect = false;
		_stage.frameRate = factory.targetFramerate;
		_stage.scaleMode = StageScaleMode.NO_SCALE;
		_stage.quality = StageQuality.LOW;

		var l_mask:Sprite = new Sprite();
		l_mask.graphics.beginFill( 0xFFFFFF );
		l_mask.graphics.drawRect( 0, 0, factory.width, factory.height );
		l_mask.graphics.endFill();
		_view.sprite.mask = l_mask;
		
		var l_contextMenu:ContextMenu = new ContextMenu();
		l_contextMenu.customItems.push( new ContextMenuItem( factory.id + " v" + factory.version + " By " + factory.author, false, false ) );
		l_contextMenu.customItems.push( new ContextMenuItem( _POWERED_BY, false, false ) );
		if ( factory.isDecached || factory.isDebug ) l_contextMenu.customItems.push( new ContextMenuItem( _RELEASE_CAUTION, false, false ) );
		
		var l_reset:ContextMenuItem = new ContextMenuItem( factory.config.exists( "settings.contextMenu.resetSessions" ) ? getConfig( "settings.contextMenu.resetSessions" ) : _RESET_SESSIONS );
		l_contextMenu.customItems.push( l_reset );
		l_reset.addEventListener( ContextMenuEvent.MENU_ITEM_SELECT, function( ?event:Event ) { l_instance._totalReset(); } );
		
		_eyeCandyEnableContextMenuItem = new ContextMenuItem( factory.config.exists( "settings.contextMenu.eyeCandyEnable" ) ? getConfig( "settings.contextMenu.eyeCandyEnable" ) : _EYE_CANDY_ENABLE );
		_eyeCandyEnableContextMenuItem.addEventListener( ContextMenuEvent.MENU_ITEM_SELECT, function( ?event:Event ) { l_instance.isEyeCandy = true; } );
		_eyeCandyDisableContextMenuItem = new ContextMenuItem( factory.config.exists( "settings.contextMenu.eyeCandyDisable" ) ? getConfig( "settings.contextMenu.eyeCandyDisable" ) : _EYE_CANDY_DISABLE );
		_eyeCandyDisableContextMenuItem.addEventListener( ContextMenuEvent.MENU_ITEM_SELECT, function( ?event:Event ) { l_instance.isEyeCandy = false; } );
		
		_fullScreenEnableContextMenuItem = new ContextMenuItem( factory.config.exists( "settings.contextMenu.fullScreenEnable" ) ? getConfig( "settings.contextMenu.fullScreenEnable" ) : _FULL_SCREEN_ENABLE );
		_fullScreenEnableContextMenuItem.addEventListener( ContextMenuEvent.MENU_ITEM_SELECT, function( ?event:Event ) { l_instance.isFullScreen = true; } );
		_fullScreenDisableContextMenuItem = new ContextMenuItem( factory.config.exists( "settings.contextMenu.fullScreenDisable" ) ? getConfig( "settings.contextMenu.fullScreenDisable" ) : _FULL_SCREEN_DISABLE );
		_fullScreenDisableContextMenuItem.addEventListener( ContextMenuEvent.MENU_ITEM_SELECT, function( ?event:Event ) { l_instance.isFullScreen = false; } );
		
		_stage.addEventListener( FullScreenEvent.FULL_SCREEN, _onFullScreen );
		
		l_contextMenu.hideBuiltInItems();
		_view.sprite.contextMenu = l_contextMenu;
		isEyeCandy = true;
		isFullScreen = false;
	}
	
	private function _onFullScreen( ?event:FullScreenEvent ):Void
	{
		isFullScreen = event.fullScreen;
	}
	
	override private function _updater( ?deltaTime:Int = 0 ):Void 
	{
		super._updater( deltaTime );
		for ( i in _processes ) i.update( deltaTime );
	}
	
	override private function _disposer():Void
	{
		for ( i in _processes ) _removeProcess( i );
		_view.dispose();
		_view = null;
		_stage.removeEventListener( FullScreenEvent.FULL_SCREEN, _onFullScreen );
		assets = _assetManager = null;
		audio =	_audioManager = null;
		inputs = _inputManager = null;
		scenes = _sceneManager = null;
		messenger = _messageManager = null;
		tools = _tools = null;
		_logger = null;
		_preloader = null;
		session = null;
		super._disposer();
	}	
	
	public function getConfig( id:String ):Dynamic
	{
		return factory.config.exists( id ) ? factory.config.get( id ) : null;
	}
	
	public function log( value:Dynamic ):Void
	{
		if ( _logger != null ) _logger.log( value );
		else if ( isDebug ) trace( "LOG: " + value );
	}	
	
	public function getFramerate( ?asActual:Bool = true ):Float
	{
		return asActual ? _helperFramerate.framerate : factory.targetFramerate;
	}
	
	public function mainUpdate():Void
	{
		_helperFramerate.update();
		var l_deltaTime:Int = factory.isFixedUpdates ? Std.int( 1000 / factory.targetFramerate ) : _helperFramerate.timeInterval;
		_updater( l_deltaTime ); // avoid isActive
	}
	
	private function _addProcess( process:IProcess, ?isLast:Bool = true ):Void
	{
		if ( process == null ) return;
		if ( isLast ) _processes.add( process );
		else _processes.push( process );
	}
	
	private function _removeProcess( process:IProcess ):Bool
	{
		if ( process == null ) return false;
		process.dispose();
		return _processes.remove( process );
	}
	
	private function _totalReset():Void
	{
		if ( !_isPreloaded ) return;
		session.deleteAllSessions();
		scenes.setScene( factory.startingSceneType );
	}
	
	private function __set_isEyeCandy( value:Bool ):Bool
	{
		isEyeCandy = value;
		_view.sprite.contextMenu.customItems.remove( _eyeCandyEnableContextMenuItem );
		_view.sprite.contextMenu.customItems.remove( _eyeCandyDisableContextMenuItem );
		_view.sprite.contextMenu.customItems.push( isEyeCandy ? _eyeCandyDisableContextMenuItem : _eyeCandyEnableContextMenuItem );		
		return isEyeCandy;
	}
	
	private function __set_isFullScreen( value:Bool ):Bool
	{
		isFullScreen = value;
		_view.sprite.contextMenu.customItems.remove( _fullScreenEnableContextMenuItem );
		_view.sprite.contextMenu.customItems.remove( _fullScreenDisableContextMenuItem );
		_view.sprite.contextMenu.customItems.push( isFullScreen ? _fullScreenDisableContextMenuItem : _fullScreenEnableContextMenuItem );		
		_stage.fullScreenSourceRect = new Rectangle( 0, 0, _kernel.factory.width, _kernel.factory.height );
		_stage.displayState = isFullScreen ? StageDisplayState.FULL_SCREEN : StageDisplayState.NORMAL;
		return isEyeCandy;
	}	
	
	override private function _pauser():Void
	{
		super._pauser();
		if ( scenes.scene != null ) scenes.scene.pause();
	}
	
	override private function _resumer():Void
	{
		super._resumer();
		if ( scenes.scene != null ) scenes.scene.resume();
	}	
}

private class _HelperFramerate
{
	public var framerate( default, null ):Float;
	public var timeInterval( default, null ):Int;
	private var _timeAtLastUpdate:Int;
	private var _timer:Void->Int;
	
	public function new( framerate:Float )
	{
		this.framerate = framerate;
		_timer = flash.Lib.getTimer;
		_timeAtLastUpdate = _timer();
	}
	
	public function update()
	{
		timeInterval = _timer() - _timeAtLastUpdate;
		framerate = 1000 / timeInterval;
		_timeAtLastUpdate = _timer();
	}	
}