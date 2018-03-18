import flixel.input.keyboard.FlxKey;
class ControlMapper {
    private var mapping:Map<GameControls, Int>;
    public function new() {
        mapping = new Map<GameControls, Int>();
        setDefaults();
    }

    public function get(control:GameControls) {
        return mapping[control];
    }

    public function set(control:GameControls, key:Int) {
        mapping[control] = key;
    }

    public function setDefaults() {
        mapping[GameControls.UP] = FlxKey.UP;
        mapping[GameControls.DOWN] = FlxKey.DOWN;
        mapping[GameControls.LEFT] = FlxKey.LEFT;
        mapping[GameControls.RIGHT] = FlxKey.RIGHT;
        mapping[GameControls.BOOST] = FlxKey.X;
        mapping[GameControls.SLOWTIME] = FlxKey.Z;
    }
}