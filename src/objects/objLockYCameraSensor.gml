#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
lockedY = -1;
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
        _player.cam.lockedY = lockedY;
    } else {
        if (_player.cam.lockedY == lockedY) {
            _player.cam.lockedY = -1;
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
//field lockedY : number

if (lockedY == -1) {
    lockedY = y + (sprite_height / 2);
}
