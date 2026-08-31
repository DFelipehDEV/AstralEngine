#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
event_inherited();
lockedX = -1;
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
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// onEnter
if (instance_exists(target)) {
    if (instance_exists(target.cam)) {
        target.cam.lockedX = lockedX;
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
    if (instance_exists(target.cam)) {
        if (target.cam.lockedX == lockedX) {
            target.cam.lockedX = -1;
        }
    }
}
