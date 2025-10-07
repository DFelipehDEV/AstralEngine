#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

// Array to store enemy data:
// enemy[0, 0] = x;
// enemy[0, 1] = y;
// enemy[0, 2] = object;
// enemy[0, 3] = health;
// enemy[0, 4] = phase;

player = noone;

phaseCurrent = 0;              // Current phase number
phaseEnemiesRemaining = 0;     // Number of enemies remaining in the current phase
phaseEnemiesCreated = false;   // Flag to track if enemies have been created for the current phase
phaseMax = 0;                  // Total number of phases
enemyMax = 0;                  // Total number of enemies in the enemyData array
phase = 0;                     // Phase counter

active = false;                // Flag to indicate if the event is active
delay = 40;                    // Delay timer for the event
ended = false;                 // Flag to indicate if all phases have ended
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle

if (player != noone && active) {
    delay = max(delay - 1, 0);

    if (ended) {
        player.hud.enemy = false;
        if (player.hud.enemyScale < 0.8) {
            instance_destroy();
        }
        exit;
    }

    if (delay == 0) {
        // Check if there are no enemies remaining in the current phase
        if (phaseEnemiesRemaining == 0 && !phaseEnemiesCreated) {
            var i;
            // Loop through all enemies
            for (i = 0; i < enemyMax; i += 1) {
                // Create the enemy if he is part of the current phase
                if (enemy[i, 4] == phaseCurrent) {
                    with (instance_create(enemy[i, 0], enemy[i, 1], enemy[i, 2])) {
                        DeactivateExceptionsAdd(id);
                        hp = other.enemy[i, 3];
                        maxHP = other.enemy[i, 3];
                        repeat(3) {
                            CreateDummy(x + random_range(-20, 20), y + random_range(-20, 20), sprStar, 0.15, 0, choose(-1, 1), bm_normal, 1, 1, 1, 0);
                        }
                    }

                    phaseEnemiesRemaining += 1;
                }
            }
            // Mark that enemies have been created for the current phase
            phaseEnemiesCreated = true;
            phase += 1;
            phaseCurrent += 1;

            // Check if there are no more phases left and the event has ended
            if (!ended && phase > phaseMax + 1) {
                // Reset camera
                ended = true;
                player.cam.leftBorder = 0;
                player.cam.rightBorder = room_width;
                player.cam.topBorder = 0;
                player.cam.bottomBorder = room_height;
            }
        }

    }

    player.hud.enemyFrame = phaseEnemiesRemaining;
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start fight

player = instance_nearest(x, y, objPlayer);
// Check if all phases have not ended
if (!ended) {
    // If the event is not active yet, set up the enemy HUD
    if (!active) {
        // Initialize enemy HUD
        player.hud.enemy = true;
        player.hud.enemyScale = 0;
    }

    // Set camera borders to the fight region
    if (delay == 10) {
        player.cam.leftBorder = x;
        player.cam.rightBorder = x + image_xscale;
        player.cam.topBorder = y;
        player.cam.bottomBorder = y + image_yscale + 1
    }
}

active = true;
