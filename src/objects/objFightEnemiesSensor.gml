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

// Check if the event is happening
if (active) {
    delay = max(delay - 1, 0);

    // Check if all phases ended and the enemy HUD is gone
    if (ended) {
        objControllerStage.hudEnemy = false;
        if (objControllerStage.hudEnemyScale < 0.8) {
            instance_destroy();
        }
        exit;
    }

    // Check if the event delay has reached 0
    if (delay == 0) {
            // Check if there are no enemies remaining in the current phase
        if (phaseEnemiesRemaining == 0 && !phaseEnemiesCreated) {
            var i;
            // Loop through all enemies
            for (i = 0; i < enemyMax; i += 1) {
                // Create the enemy if he is part of the current phase
                if (enemy[i, 4] == phaseCurrent) {
                    with (instance_create(enemy[i, 0], enemy[i, 1], enemy[i, 2])) {
                        enemyHP = other.enemy[i, 3];
                        enemyHPMax = other.enemy[i, 3];
                        repeat(3) {
                            DummyEffectCreate(x + random_range(-20, 20), y + random_range(-20, 20), sprVFXStar1, 0.15, 0, choose(-1, 1), bm_normal, 1, 1, 1, 0);
                        }
                    }

                    // Increase the count of enemies created in the current phase
                    phaseEnemiesRemaining += 1;
                }
            }
            // Mark that enemies have been created for the current phase
            phaseEnemiesCreated = true;
            phase += 1;
            phaseCurrent += 1;

            // Check if there are no more phases left and the event has ended
            if (!ended && phase > phaseMax + 1) {
                ended = true;
                // Reset camera
                with (objCamera) {
                    camBorderLeft = 0;              // Camera left border
                    camBorderRight = room_width;     // Camera right border
                    camBorderTop = 0;              // Camera top border
                    camBorderBottom = room_height;    // Camera bottom border
                    camTarget = objPlayer;
                }
            }
        }
    }

    // Update the HUD frame
    objControllerStage.hudEnemyFrame = phaseEnemiesRemaining;
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start fight

// Check if all phases have not ended
if (!ended) {
    // If the event is not active yet, set up the enemy HUD
    if (!active) {
        // Initialize enemy HUD
        objControllerStage.hudEnemy = true;
        objControllerStage.hudEnemyScale = 0;
    }

    // Set camera borders to the fight region
    if (delay == 10) {
        objCamera.camBorderLeft = x;
        objCamera.camBorderRight = x + image_xscale;
        objCamera.camBorderTop = y;
        objCamera.camBorderBottom = y + image_yscale + 1
    }
}

active = true;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*preview
*/
