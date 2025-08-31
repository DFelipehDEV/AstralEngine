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

// Move the body to our position
var _body;
_body = instance_place(x, y - 5, objBody);
if (_body != noone) {
    if (_body.ySpeed >= 0 && _body.ground) {
        _body.x += x - xprevious;
        _body.y = bbox_top - 12;
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
