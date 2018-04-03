import flixel.FlxSprite;
import flixel.FlxObject;
class Bullet extends FlxSprite {
    static var SPEED = 300;
    override public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
        loadGraphic(AssetPaths.bullet__png, true, 2, 2);
        animation.add("spin", [0, 1], 6, true);
        animation.play("spin");
    }

    public function spawn(x:Float, y:Float, facing:Int) {
        this.facing = facing;
        this.x = x;
        this.y = y;
        this.velocity.x = 0;
        this.velocity.y = 0;
        switch(this.facing) {
            case FlxObject.UP:
                this.velocity.y = -SPEED;
            case FlxObject.DOWN:
                this.velocity.y = SPEED;
            case FlxObject.RIGHT:
                this.velocity.x = SPEED;
            case FlxObject.LEFT:
                this.velocity.x = -SPEED;
        }
    }
}