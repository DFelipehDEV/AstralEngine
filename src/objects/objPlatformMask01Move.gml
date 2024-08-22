#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

ySpeed = 0;
xSpeed = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move

x += xSpeed;
y += ySpeed;

xSpeed = approach(xSpeed, 2 * dcos(direction), 0.1);
ySpeed = approach(ySpeed, 2 * -dsin(direction), 0.1);


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

direction = other.image_angle;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw

//draw_background_part(tileTZ, 0, 0, 128, 128, x, y)
draw_self();
