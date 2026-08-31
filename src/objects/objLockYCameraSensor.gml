#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
event_inherited();
lockedY = -1;
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
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// onEnter
if (instance_exists(target)) {
    if (instance_exists(target.cam)) {
        target.cam.lockedY = lockedY;
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
        if (target.cam.lockedY == lockedY) {
            target.cam.lockedY = -1;
        }
    }
}
