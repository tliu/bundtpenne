package ;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;

class Player extends FlxSprite{
    static var RUNSPEED = 150;
    static var BOOSTSPEED = 500;
    static var JUMPSPEED = 150;
    var boosting:Bool;
    var controls:ControlMapper;
    public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
        controls = new ControlMapper();
        loadGraphic(AssetPaths.bundt__png);
        setFacingFlip(FlxObject.RIGHT, false, false);
        setFacingFlip(FlxObject.LEFT, true, false);
        acceleration.y = Constants.GRAVITY;  
        maxVelocity.y = 250;
        boosting = false;
    }

    override public function update(elapsed:Float) {
        velocity.x = 0;
        boosting = false;
        FlxG.watch.add(velocity, "x");
        FlxG.watch.add(velocity, "y");
        FlxG.timeScale = 1.0;

        processControls();
        super.update(elapsed);
    }

    private function processControls() {
        if (FlxG.keys.pressed.ESCAPE) {
            Sys.exit(1);
        }

        if (FlxG.keys.anyPressed([controls.get(GameControls.BOOST)])) {
            boosting = true;
            if (FlxG.keys.anyPressed([controls.get(GameControls.RIGHT)])) {
                this.velocity.x = BOOSTSPEED;
            }
            if (FlxG.keys.anyPressed([controls.get(GameControls.LEFT)])) {
                this.velocity.x = -BOOSTSPEED;
            }
            if (FlxG.keys.anyPressed([controls.get(GameControls.UP)])) {
                this.velocity.y = -BOOSTSPEED;
            }
            if (FlxG.keys.anyPressed([controls.get(GameControls.DOWN)])) {
                this.velocity.y = BOOSTSPEED;
            }
        }
    
        if (FlxG.keys.anyPressed([controls.get(GameControls.SLOWTIME)])) {
            FlxG.timeScale = 0.5;
        } 

        if (!boosting) {
            if (FlxG.keys.anyPressed([controls.get(GameControls.RIGHT)])) {
                velocity.x = RUNSPEED;
                facing = FlxObject.RIGHT;
            }

            if (FlxG.keys.anyPressed([controls.get(GameControls.LEFT)])) {
                velocity.x = -RUNSPEED;
                facing = FlxObject.LEFT;
            }
            
            if (FlxG.keys.anyPressed([controls.get(GameControls.UP)])) {
                if (isTouching(FlxObject.FLOOR)) {
                    velocity.y = -JUMPSPEED;
                }
            }
        }
    }
}

