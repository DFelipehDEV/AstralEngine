#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

ySpeed = 0;
xSpeed = 0;
chainLength = 110;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move

x += xSpeed;
y += ySpeed;

direction += 2;
xSpeed = dcos(direction)*4
ySpeed = -dsin(direction)*4

// Move the player to our position
var _ownerID;
_ownerID = instance_place(x, y - 5, objPlayer);
if (_ownerID != noone) {
    if (_ownerID.ySpeed >= 0 && _ownerID.ground) {
        _ownerID.x += x - xprevious;
        _ownerID.y = bbox_top - 12;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw

// Draw the chain
var _chainPosX, _chainPosY;
_chainPosX = xstart;
_chainPosY = ystart - 128;
var i;
for (i = 0; i < chainLength; i += sprite_get_width(sprRing)) {
    var _x, _y;
    _x = (_chainPosX) + lengthdir_x(i, point_direction(_chainPosX, _chainPosY, x, y));
    _y = (_chainPosY) + lengthdir_y(i, point_direction(_chainPosX, _chainPosY, x, y));

    draw_sprite(sprRingSparkle3, current_time div 60, _x, _y);
}

// Draw the platform object
draw_self();
