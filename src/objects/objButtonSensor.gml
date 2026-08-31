#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
event_inherited();
action = "";
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field action: string
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// onEnter
if (instance_exists(target)) {
    if (instance_exists(target.hud)) {
        if (!instance_exists(target.hud.buttonPopup)) {
            target.hud.buttonPopup = instance_create(target.x, target.y, objPressButtonPopup);
            target.hud.buttonPopup.action = action;
            PlaySound(sndMenuWarn);
        }
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
        if (instance_exists(target.hud.buttonPopup)) {
            target.hud.buttonPopup.destroy = true;
        }
    }
}
