#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
event_inherited();

spawnedEnemies = dss_list_create();

player = noone;
hud = noone;

phaseCurrent = 0;              // Current phase number
phaseEnemiesRemaining = 0;     // Number of enemies remaining in the current phase
phaseEnemiesCreated = false;   // Flag to track if enemies have been created for the current phase
phaseMax = 0;                  // Total number of phases
enemyMax = 0;                  // Total number of enemies in the enemyData array

active = false;                // Flag to indicate if the event is active
delay = 40;                    // Delay timer for the event
ended = false;                 // Flag to indicate if all phases have ended
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup
if (spawnedEnemies != -1) {
    dss_destroy(spawnedEnemies);
    spawnedEnemies = -1;
}

if (instance_exists(hud)) {
    hud.destroy = true;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle Combat
if (active) {
    delay = max(delay - 1, 0);

    if (ended) {
        if (instance_exists(hud)) {
            hud.destroy = true;
        }
        instance_destroy();
        exit;
    }

    // Lock camera during countdown
    if (delay == 10 && !ended) {
        if (instance_exists(player)) {
            if (instance_exists(player.cam)) {
                player.cam.leftBorder = x;
                player.cam.rightBorder = x + image_xscale;
                player.cam.topBorder = y;
                player.cam.bottomBorder = y + image_yscale + 1;
            }
        }
    }

    // Check active wave enemies
    if (phaseEnemiesCreated) {
        var _alive;
        _alive = 0;
        var i;
        for (i = ds_list_size(spawnedEnemies) - 1; i >= 0; i -= 1) {
            if (instance_exists(ds_list_find_value(spawnedEnemies, i))) {
                _alive += 1;
            } else {
                ds_list_delete(spawnedEnemies, i);
                if (instance_exists(hud)) {
                    hud.scale = 3; // Bounce effect on enemy kill
                }
            }
        }
        phaseEnemiesRemaining = _alive;

        if (instance_exists(hud)) {
            hud.count = phaseEnemiesRemaining;
        }

        if (phaseEnemiesRemaining == 0) {
            if (phaseCurrent > phaseMax) {
                // All waves defeated
                ended = true;
                if (instance_exists(hud)) {
                    hud.destroy = true;
                }
                if (instance_exists(player)) {
                    if (instance_exists(player.cam)) {
                        player.cam.leftBorder = 0;
                        player.cam.rightBorder = room_width;
                        player.cam.topBorder = 0;
                        player.cam.bottomBorder = room_height;
                    }
                }
            } else {
                // Delay before next wave
                delay = 60;
                phaseEnemiesCreated = false;
            }
        }
    }

    // Spawn next wave when ready
    if (delay == 0 && !phaseEnemiesCreated && !ended) {
        var i;
        ds_list_clear(spawnedEnemies);

        for (i = 0; i < enemyMax; i += 1) {
            if (enemy[i, 4] == phaseCurrent) {
                var _inst;
                _inst = instance_create(enemy[i, 0], enemy[i, 1], enemy[i, 2]);
                with (_inst) {
                    DeactivateExceptionsAdd(id);
                    hp = other.enemy[i, 3];
                    maxHP = other.enemy[i, 3];
                    repeat(3) {
                        CreateDummy(x + random_range(-20, 20), y + random_range(-20, 20), sprStar, 0.15, 0, choose(-1, 1), bm_normal, 1, 1, 1, 0);
                    }
                }
                ds_list_add(spawnedEnemies, _inst);
            }
        }

        phaseEnemiesRemaining = ds_list_size(spawnedEnemies);
        phaseEnemiesCreated = true;
        phaseCurrent += 1;

        if (!instance_exists(hud)) {
            hud = instance_create(x, y, objEnemiesArenaHUD);
        }
        hud.count = phaseEnemiesRemaining;
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup
if (spawnedEnemies != -1) {
    dss_destroy(spawnedEnemies);
    spawnedEnemies = -1;
}

if (instance_exists(hud)) {
    hud.destroy = true;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// onEnter
player = target;

if (!ended && !active) {
    active = true;
    delay = 40;
}
