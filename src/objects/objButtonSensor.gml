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
    var _wasInSensor, _isInSensor;
    _wasInSensor = place_meeting(xprevious, yprevious, other);
    _isInSensor = place_meeting(x, y, other);

    if (!_wasInSensor && _isInSensor) {
        hud.buttonAction = other.action;
        PlaySound(sndMenuWarn);
    } else if (_wasInSensor && !_isInSensor) {
        hud.buttonAction = "";
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
