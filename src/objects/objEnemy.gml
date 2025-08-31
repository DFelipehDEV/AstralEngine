#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

event_inherited();
canMove = true;

knockOnDeath = false; // Whether the enemy gets knocked away when defeated

maxHP = 0; // Maximum HP of the enemy
hp = maxHP; // Current HP of the enemy

hit = false;
invincibilityTimer = 0; // Invincibility frames after taking damage
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activation region

instance_activate_region(bbox_left - 4, bbox_top - 4, (bbox_left - bbox_right) + 8, (bbox_top - bbox_bottom) + 8, 1);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Invincibility

if (invincibilityTimer > 0) {
    invincibilityTimer -= 1;
}

hit = false;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field maxHP : number
//field knockOnDeath : bool
//field canMove : bool

hp = maxHP;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HP bar

if (hp > 0 && maxHP > 0) {
    var _width, _height, _yOffset, _x1, _x2;
    _width = maxHP * 6;
    _height = 6;
    _yOffset = -5;
    _x1 = x - _width / 2;
    _x2 = x + _width / 2;
    draw_healthbar(_x1, bbox_top + _yOffset, _x2, bbox_top + _yOffset + _height, (hp / maxHP) * 100, c_black, c_red, c_lime, 0, true, true);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw enemy and HP

draw_self();

// HP bar
event_user(0);
