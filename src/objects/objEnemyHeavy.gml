#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
event_inherited();
image_speed = 0.15;

StatesInit(HeavyStateNormal);
target = noone;

hammer = false;
normalStateX = x;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement
if (canMove) {
    BodyApplyGravity(0.2);
    move_and_collide(xSpeed * global.timeScale, ySpeed * global.timeScale, objTerrain);
}

// Vertical movement
if (!ground) {
    // Check if landing on solid ground
    if (place_meeting(x, y + 2, objTerrain) && ySpeed >= 0) {
        ground = true;
        ySpeed = 0;
    }
} else {
    // Check if leaving the ground
    if (!place_meeting(x, y + 5, objTerrain)) {
        ground = false;
    }
}

StatesUpdate(global.timeScale);

x = clamp(x, objCamera.leftBorder, objCamera.rightBorder);
