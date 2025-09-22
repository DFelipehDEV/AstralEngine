#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

event_inherited();

StatesInit(EggpawnStateNormal);

target = noone;

delay = 0;

knockOnDeath = true;

EnemySetAnimation(sprEnemyEggpawnWalk, 0.2);

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
    move_and_collide(xSpeed, ySpeed, objTerrain);
} else {
    EnemySetAnimation(sprEnemyEggpawnIdle, 0.2);
}

// Vertical movement
if (!ground) {
    // Check if landing on solid ground
    if (place_meeting(x, y + 2, objTerrain) && ySpeed >= 0) {
        ground = true;
        ySpeed = 0;
    }
}
else {
    // Check if leaving the ground
    if (!place_meeting(x, y + 5, objTerrain)) {
        ground = false;
    }
}

StatesUpdate(global.timeScale);

x = clamp(x, objCamera.leftBorder, objCamera.rightBorder);
