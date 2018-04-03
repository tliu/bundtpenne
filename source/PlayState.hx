package;

import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
    private var map:FlxOgmoLoader;
    private var player:Player;
    private var walls:FlxTilemap;
    private var bullets:FlxTypedGroup<Bullet>;

	override public function create():Void
	{
		super.create();
        add(new FlxText(0, 0, 0, "hello", 63));
        bgColor = FlxColor.WHITE;
        FlxG.mouse.useSystemCursor = true;
        player = new Player(this, 30, 0);
        add(player);
        map = new FlxOgmoLoader(AssetPaths.test__oel);
        walls = map.loadTilemap(AssetPaths.tiles__png, 16, 16,"walls");
        walls.follow();
        add(walls);
        FlxG.camera.follow(player);

        bullets = new FlxTypedGroup<Bullet>(100);
        for (i in 0...100) {
            var bullet = new Bullet();
            bullet.kill();
            bullets.add(bullet);
        }
        add(bullets);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
        FlxG.collide(walls, player);
	}

    public function getBullet():Bullet {
        return this.bullets.recycle(Bullet);
    }

}
