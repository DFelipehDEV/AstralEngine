#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

event_inherited();
xSpeed = 2.2;
ySpeed = -10;

knockOnDeath = true;

hp= noone;
maxHP = noone;


image_speed = 0.3;           // Animation speed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (canMove) {
    x += xSpeed * global.timeScale;
    y += ySpeed * global.timeScale;

    ySpeed = approach(ySpeed, 12, 0.45 * global.timeScale);

    // Invert direction
    if (ySpeed > 0 && y >= ystart) {
        xSpeed = -xSpeed;
        ySpeed = -ySpeed;
        image_yscale = sign(xSpeed);
    }

    image_angle = point_direction(xprevious, yprevious, x, y);
}
