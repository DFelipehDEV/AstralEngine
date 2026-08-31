#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
lookFor = objPlayer;
target = noone;
inside = false;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Detection
if (!instance_exists(lookFor)) exit;

var _inst;
_inst = instance_place(x, y, lookFor);

if (_inst != noone) {
    if (!inside) {
        inside = true;
        target = _inst;
        event_user(0); // onEnter
    }
    event_user(1);     // onStay
} else if (inside) {
    inside = false;
    event_user(2);     // onLeave
    target = noone;
}
