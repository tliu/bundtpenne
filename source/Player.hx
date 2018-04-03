package ;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;

class Player extends FlxSprite{
    static var RUNSPEED = 150;
    static var BOOSTSPEED = 500;
    static var JUMPSPEED = 150;
    static var MAX_FUEL = 0.699;
    private var game:PlayState;
    var boosting:Bool;
    var boostDirection:EnumValue;
    var fuel:Float;
    var controls:ControlMapper;
    override public function new(game:PlayState, x:Float = 0, y:Float = 0) {
        super(x, y);
        this.game = game;
        controls = new ControlMapper();
        loadGraphic(AssetPaths.bundt__png);
        setFacingFlip(FlxObject.RIGHT, false, false);
        setFacingFlip(FlxObject.LEFT, true, false);
        acceleration.y = Constants.GRAVITY;  
        boosting = false;
        boostDirection = BoostDirection.OFF;
    }

    override public function update(elapsed:Float) {
        boosting = false;
        FlxG.watch.add(velocity, "x");
        FlxG.watch.add(velocity, "y");
        FlxG.timeScale = 1.0;
        this.acceleration.y = Constants.GRAVITY;
        if (this.isTouching(FlxObject.FLOOR)) {
            this.fuel = MAX_FUEL;
        }
        if (this.boostDirection == BoostDirection.OFF) {
            processOnGroundControls();
        }

        aimGun();
        //processControls();
        if (FlxG.keys.anyJustPressed([controls.get(GameControls.BOOST)])) {
            if (this.isTouching(FlxObject.FLOOR)) {
                this.velocity.y = JUMPSPEED;
            } else {
                boosting = true;
            }
        }

        if (boosting && 
            FlxG.keys.anyPressed([controls.get(GameControls.BOOST)]) && 
            !this.isTouching(FlxObject.FLOOR)) {
            if (FlxG.keys.anyJustPressed([controls.get(GameControls.RIGHT)])) {
                this.boostDirection = BoostDirection.RIGHT;
            } else if (FlxG.keys.anyJustPressed([controls.get(GameControls.DOWN)])) {
                this.boostDirection = BoostDirection.DOWN;
            } else if (FlxG.keys.anyJustPressed([controls.get(GameControls.LEFT)])) {
                this.boostDirection = BoostDirection.LEFT;
            } else if (FlxG.keys.anyJustPressed([controls.get(GameControls.UP)])) {
                this.boostDirection = BoostDirection.UP;
            }
        }
        super.update(elapsed);
    }

    private function aimGun() {
        // change anim based on up/down
    }

    private function processOnGroundControls() {
        if (FlxG.keys.anyJustPressed([controls.get(GameControls.RIGHT)])) {
            velocity.x = -RUNSPEED;
            this.facing = FlxObject.RIGHT;
        } else if (FlxG.keys.anyJustPressed([controls.get(GameControls.LEFT)])) {
            velocity.x = -RUNSPEED;
            this.facing = FlxObject.RIGHT;
        } else {
            velocity.x = 0;
        }
    }

    private function processControls() {
        if (FlxG.keys.pressed.ESCAPE) {
            Sys.exit(1);
        }

        if (FlxG.keys.anyJustPressed([controls.get(GameControls.RIGHT)])) {
            this.facing = FlxObject.RIGHT;
        }
        if (FlxG.keys.anyJustPressed([controls.get(GameControls.LEFT)])) {
            this.facing = FlxObject.LEFT;
        }
        if (FlxG.keys.anyJustPressed([controls.get(GameControls.UP)])) {
            this.facing = FlxObject.UP;
        }
        if (FlxG.keys.anyJustPressed([controls.get(GameControls.DOWN)])) {
            this.facing = FlxObject.DOWN;
        }

        if (FlxG.keys.anyJustPressed([controls.get(GameControls.SHOOT)])) {
            //var bullet = InstanceMgr.instance.getBullet();
            //bullet.spawn(this.x, this.y, this.facing);
            FlxG.log.notice(this.facing);
            var b = game.getBullet();
            b.spawn(this.x, this.y, this.facing);
            b.revive();
        }

        if (FlxG.keys.anyPressed([controls.get(GameControls.BOOST)])) {
            boosting = true;
            if (FlxG.keys.anyPressed([controls.get(GameControls.RIGHT)])) {
                this.velocity.x = BOOSTSPEED;
                this.velocity.y = 0;
            }
            if (FlxG.keys.anyPressed([controls.get(GameControls.LEFT)])) {
                this.velocity.x = -BOOSTSPEED;
                this.velocity.y = 0;
            }
            if (FlxG.keys.anyPressed([controls.get(GameControls.UP)])) {
                this.velocity.y = -BOOSTSPEED;
                this.velocity.x = 0;
            }
            if (FlxG.keys.anyPressed([controls.get(GameControls.DOWN)])) {
                this.velocity.y = BOOSTSPEED;
                this.velocity.x = 0;
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

