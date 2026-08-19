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
tileset = -1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move
// dont do anything at the start of the room so the instace grouper has time to group all objects
if (objWorld.gameTime < 100) exit;
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
//field tileset: background
//field left: number
//field top: number
//field gridX: number
//field gridY: number

/*preview
if (!FieldDefined("tileset")) {
    draw_self();
} else {
    if (!(FieldDefined("left") && FieldDefined("top") && FieldDefined("gridX") && FieldDefined("gridY"))) exit;
    draw_background_part(Background(Field("tileset")), Field("left"), Field("top"), Field("gridX"), Field("gridY"), x, y);
}
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
if (tileset == -1) {
    draw_self();
} else {
    draw_background_part(tileset, left, top, gridX, gridY, x, y);
}
