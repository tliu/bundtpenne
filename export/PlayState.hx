package;

//import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
//import flixel.addons.editors.tiled.TiledTileLayer;
//import flixel.tile.FlxTilemap;
//import flixel.addons.editors.tiled.TiledMap;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
    /*
    private var map:TiledMap;
    private var walls:FlxTilemap;
    */
	override public function create():Void
	{
		super.create();
        add(new FlxText(0, 0, 0, "hello", 63));
        bgColor = FlxColor.WHITE;
        FlxG.mouse.useSystemCursor = true;
        add(new Player());
        /*
        map = new TiledMap(AssetPaths.test_map__tmx);
        walls = new FlxTilemap();
        walls.loadMapFromArray(cast(map.getLayer("walls"), TiledTileLayer).tileArray, map.width, map.height, AssetPaths.tiles__png, map.tileWidth, map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 0);
        walls.follow();
        add(walls);
        */


	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
