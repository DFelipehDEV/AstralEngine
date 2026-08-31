#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// onEnter
if (instance_exists(target)) {
    if (instance_exists(target.hud)) {
        target.hud.hidden = true;
    }
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// onLeave
if (instance_exists(target)) {
    if (instance_exists(target.hud)) {
        target.hud.hidden = false;
    }
}
