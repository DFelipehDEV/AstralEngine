#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
onCollide = RingCollide;
value = 1;
MarkAsActive();
image_speed = 0;

xSpeed = 0;
ySpeed = 0;
yGravity = 0.1863;
liveTimer = 120;
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
if (place_meeting(x + xSpeed, y - 4, objTerrain)) {
    xSpeed = -xSpeed;
    xSpeed *= 0.98;
}

// Up/Bottom
if (place_meeting(x, y + ySpeed, objTerrain)) {
    ySpeed = -ySpeed;
    ySpeed *= 0.98;
}

x += xSpeed;
y += ySpeed;
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
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activate region
instance_activate_region(bbox_left, bbox_top, 32, 32, 1)
