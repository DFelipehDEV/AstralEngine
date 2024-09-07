#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Hide HUD
var _player;
_player = instance_nearest(x, y, objPlayer);
with (_player) {
    // Check if we are in the sensor
    if (place_meeting(x, y, other)) {
        hud.hidden = true;
    }
    else {
        // Check if we leaved the sensor
        if (place_meeting(xprevious, yprevious, other)) {
            hud.hidden = false;
        }
    }
}
