#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Path

path = noone;
path_speed = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move

// Move the player to our position
var _ownerID;
_ownerID = instance_place(x, y - 5, objPlayer);
if (_ownerID != noone) {
    if (_ownerID.ySpeed >= 0 && _ownerID.ground) {
        _ownerID.x += x - xprevious;
        _ownerID.y = bbox_top - 11;
    }
}
#define Collision_objPlatformAngle
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change direction

direction = other.image_angle;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field path: path
//field path_speed: number
//field pathAction: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
//field pathAbsolute: false

if (path != noone) {
    path_start(path, path_speed, pathAction, pathAbsolute);
}
