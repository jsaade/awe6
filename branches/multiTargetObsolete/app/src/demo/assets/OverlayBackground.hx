package demo.assets;
import awe6.interfaces.IKernel;
import flash.display.BitmapData;

/**
 * ...
 * @author Rob Fell
 */

class OverlayBackground extends BitmapData
{
	public function new( kernel:IKernel ) 
	{
		super( 600, 400, true, 0x00 );
		setPixels( rect, kernel.tools.hexToBytes( _DATA ) );		
	}	
}
