#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
xSpeed = 0;
ySpeed = 0;
ground = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Physics
BodyApplyGravity(0.2);
move_and_collide(xSpeed, ySpeed, objTerrain);

// Vertical movement
if (!ground) {
    // Check if landing on solid ground
    if (place_meeting(x, y + 1, objTerrain) && ySpeed >= 0) {
        ground = true;
        ySpeed = 0;
    }
} else {
    // Check if leaving the ground
    if (!place_meeting(x, y + 4, objTerrain)) {
        ground = false;
    }

    xSpeed = approach(xSpeed, 0, 0.1);
}
