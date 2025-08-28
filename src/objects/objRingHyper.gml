#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
image_speed = 0;

xSpeed = 0;         // Horizontal speed
ySpeed = 0;         // Vertical speed
yGravity = 0.1863;      // Gravity
dropTimer = 120;    // Amount of time that the ring can live
value = 1; // Amount of rings the ring gives the player
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);
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

image_xscale = 0.6 + abs(cos(dropTimer/15))*0.5
image_yscale = 0.6 + abs(sin(dropTimer/15))*0.5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

// Destroy if the ring has faded
if (dropTimer == 0) {
    instance_destroy();
}

// Decrease timer
dropTimer -= 1;

// Start fading
if (dropTimer < 90) {
    visible = (dropTimer mod 2)
}
