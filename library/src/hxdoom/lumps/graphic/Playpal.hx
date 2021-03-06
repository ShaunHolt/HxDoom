package hxdoom.lumps.graphic;

/*
 * The idea is to keep the doom side of things separate from the API side of things
 * This in theory should make it easier to fork and adapt for other rendering frameworks
 */


/**
 * ...
 * @author Kaelan
 */
class Playpal 
{
	public var palettes:Array<Array<Int>>;
	public function new() 
	{
		palettes = new Array();
	}
	public function addSwatch(_index:Int, _color:Int) {
		if (palettes[_index] == null) palettes[_index] = new Array();
		palettes[_index].push(_color);
	}
	public function getColorChannelFloat(_index:Int, _rgb:Int, _pal:Int = 0):Float {
		return getColorChannelInt(_index, _rgb, _pal) / 255;
	}
	public function getColorChannelInt(_index:Int, _rgb:Int, _pal:Int = 0):Int {
		var col:Int = palettes[_pal][_index];
		var val:Float = 0;
		switch (_rgb) {
			case 0:
				col = col >> 16;
			case 1:
				col = (col >> 8) & 0xFF;
			case 2:
				col = col & 0xFF;
			case 3:
				if (col == -1) col = 0;
				else col = 0xFF;
		}
		return col;
	}
	public function getColorHex(_index:Int, _pal:Int = 0):Int {
		if (_index != -1) {
			return 0xFF << 24 | palettes[_pal][_index];
		} else {
			return 0x00000000;
		}
	}
	public function toString():String {
		return ("Num Palettes Loaded: " + palettes.length);
	}
}