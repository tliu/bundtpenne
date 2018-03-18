package;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
        add(new FlxText(0, 0, 0, "hello", 63));
        bgColor = FlxColor.WHITE;
        FlxG.mouse.useSystemCursor = true;
        add(new Player());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
