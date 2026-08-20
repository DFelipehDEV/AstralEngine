#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
action = "";
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change hud button
var _player;
_player = instance_nearest(x, y, objPlayer);
if (!instance_exists(_player)) exit;
with (_player) {
    // Check if we are in the sensor
    if (place_meeting(x, y, other)) {
        if (!instance_exists(hud.buttonPopup)) {
            hud.buttonPopup = instance_create(x, y, objPressButtonPopup);
            hud.buttonPopup.action = other.action;
            PlaySound(sndMenuWarn);
        }
    } else {
        // Check if we leaved the sensor
        if (place_meeting(xprevious, yprevious, other)) {
            if (instance_exists(hud.buttonPopup)) {
                hud.buttonPopup.destroy = true;
            }
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
//field action: string
