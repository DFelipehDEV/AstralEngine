#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
lockedX = -1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle Camera Lock
var _player;
_player = instance_nearest(x, y, objPlayer);
if (instance_exists(_player) && instance_exists(_player.cam)) {
    if (place_meeting(x, y, _player)) {
        _player.cam.lockedX = lockedX;
    } else {
        if (_player.cam.lockedX == lockedX) {
            _player.cam.lockedX = -1;
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field lockedX : number

if (lockedX == -1) {
    lockedX = x + (sprite_width / 2);
}
