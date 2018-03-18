package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(288, 160, PlayState, 2.0, 60, 60, true));
	}
}
