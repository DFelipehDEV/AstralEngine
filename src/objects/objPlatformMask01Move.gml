#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

dir = 0;
acceleration = 0.1;
spd = 2;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move

hspeed = approach(hspeed, spd * dcos(dir), acceleration);
vspeed = approach(vspeed, spd * -dsin(dir), acceleration);

// Move the player to our position
var _ownerID;
_ownerID = instance_place(x, y - 5, objPlayer);
if (_ownerID != noone) {
    if (_ownerID.ySpeed >= 0 && _ownerID.ground) {
        _ownerID.x += x - xprevious;
        _ownerID.y = bbox_top - 12;
    }
}
#define Collision_objPlatformAngle
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change direction

dir = other.image_angle;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field acceleration : number
//field spd : number
