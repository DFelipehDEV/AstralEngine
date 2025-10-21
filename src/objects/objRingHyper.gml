#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
image_speed = 0;

xSpeed = 0;
ySpeed = 0;
yGravity = 0.1863;
liveTimer = 120;
value = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bounce
image_index = global.gameTime div 50;

// Gravity
if (!place_meeting(x, y, objTerrain)) {
    ySpeed += yGravity;
}

// Bounce if collided with a wall
// Left/Right
if (place_meeting(x + xSpeed, y - 6, objTerrain)) {
    xSpeed = -xSpeed;
    xSpeed *= 0.99;
}

// Up/Bottom
if (place_meeting(x, y, objTerrain) && ySpeed <= 0 || place_meeting(x, y, objTerrain) && ySpeed >= 0) {
    ySpeed = -ySpeed;
    ySpeed *= 0.99;
}

x += xSpeed;
y += ySpeed;

image_xscale = 0.6 + abs(cos(liveTimer/15))*0.5
image_yscale = 0.6 + abs(sin(liveTimer/15))*0.5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
liveTimer -= 1;

if (liveTimer < 90) {
    visible = (liveTimer mod 2)
}

if (liveTimer <= 0) {
    instance_destroy();
}
