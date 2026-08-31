#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
event_inherited();
image_speed = 0;
target = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate and Magnetism
image_index = World.gameTime div 80;

if (target != noone) {
    if (instance_exists(target)) {
        var _signPlayerX, _signPlayerY, _accX, _accY;
        _signPlayerX = sign(target.x - x);
        _signPlayerY = sign(target.y - y);

        if (sign(hspeed) == _signPlayerX) _accX = 0.2875; else _accX = 0.85;
        if (sign(vspeed) == _signPlayerY) _accY = 0.2875; else _accY = 0.85;

        hspeed += (_accX * _signPlayerX) * global.timeScale;
        vspeed += (_accY * _signPlayerY) * global.timeScale;
    } else {
        target = noone;
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//override grid 32,32,0,0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// On Collect
collector.rings += 1; // collector is given by the player when event_user(0) is called

with (collector) {
    PlayerAddEnergy(4);
}

instance_create(x, y, objRingCollected);
PlaySoundSingle(sndRing);
instance_destroy();
