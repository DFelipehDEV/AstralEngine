#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

event_inherited();

image_speed = 0.15;
turnTimer = 50;           //How long it takes to turn
turnTimerTemp = turnTimer;    //Keep the original value on track
state = "NORMAL";
nearPlayer = 0;            //Checks if the player is near of the enemy

enemyBust = true;

enemyHP= 3;
enemyHPMax = 3;

hammer = false;
normalStateX = x;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start chasing the player

state = "CHASE";
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

// Apply gravity and handle collision with slopes
BodyApplyGravity(0.2);
move_and_collide(xSpeed, ySpeed, objTerrain);

// Vertical movement
if (!ground) {
    // Check if landing on solid ground
    if (place_meeting(x, y + 1, objTerrain) && ySpeed >= 0) {
        ground = true;
        ySpeed = 0;
    }
}
else {
    // Check if leaving the ground
    if (!place_meeting(x, y + 4, objTerrain)) {
        ground = false;
    }
}

switch (state) {
    case "TURN":
        // If the turn timer is not expired, pause the enemy's movement
        if (turnTimer > 0) {
            turnTimer -= 1;
            xSpeed = 0;
        }
        else {
            EnemySetAnimation(sprEnemyHeavyTurn, 0.25);
            // Check if the animation has ended
            if (image_index >= 2) {
                image_xscale = -image_xscale;
                state = "NORMAL";
                EnemySetAnimation(sprEnemyHeavyWalk, 0.15);
            }
        }
        break;

    case "NORMAL":
        normalStateX = x;
        // Walk at normal speed
        xSpeed = 1.6 * image_xscale;

        // Check if the player is in front of the enemy
        if ((distance_to_object(objPlayer) < 140 && image_xscale == sign(objPlayer.x - x)) || (hit)) {
            // Player was spotted
            state = "SPOTTED";
        }

        // Check if the enemy is colliding with the turn sensor
        if (place_meeting(x, y, objEnemyTurn) && !place_meeting(xprevious, yprevious, objEnemyTurn)) {
            turnTimer = turnTimerTemp;
            xSpeed = 0;
            state = "TURN";
        }
        break;

    case "SPOTTED":
        image_xscale = esign(objPlayer.x - x, image_xscale);
        // Slow down the enemy's speed when in the spotted state
        xSpeed = lerp(xSpeed, 0, 0.12);
        // Play warning sound and spotted effect.
        if (alarm[1] == -1) {
            alarm[1] = 15;
            PlaySound("snd/EnemyWarn");
            DummyEffectCreate(x - 10 * image_xscale, y - 25, sprEnemyWarn, 0.25, 0, 1, bm_normal, 1, 1, 1, 0);
        }
        break;

    case "CHASE":
        // Set the enemy's speed when in the chase state.
        ownerID = instance_nearest(x, y, objPlayer);
        xSpeed = lerp(xSpeed, 3 * image_xscale, 0.1);

        image_xscale = esign(objPlayer.x - x, image_xscale);

        // If the player is too far away or too close to the enemy's turn sensor, switch to the normal state.
        if (distance_to_object(objPlayer) > 160) {
            state = "NORMAL";
        }

        if (distance_to_object(objPlayer) < 30) {
            if (objPlayer.invincibility == InvincibilityNoone) {
                xSpeed = 0;
                state = "ATTACK";
                PlaySoundExt("snd/Wind", global.volumeSounds, random_range(0.5, 0.9), false);
                EnemySetAnimation(sprEnemyHeavyAttack, 0.17);
            }
        }
        break;

    case "ATTACK":
        // Set the enemy's speed when in the chase state.
        ownerID = instance_nearest(x, y, objPlayer);

        // Check if we are on the hammer attack state
        if (image_index > 3 && image_index < 5) {
            // Check if we haven't used the hammer
            if (!hammer) {
                hammer = true;
                PlaySound("snd/EnemyHeavyAttack");
                with (ownerID.cam)
                    CameraShakeY(40);
            }

            if (collision_rectangle(x, y, x + 50, y + 32, objPlayer, false, 1)) {
                with (ownerID) {
                    PlayerHurt();
                }
            }
        }

        // Check if the animation has ended
        if (image_index >= 8) {
            // Check if we are near the player or the player is dead
            if (distance_to_object(objPlayer) > 150 || objPlayer.state == PlayerStateDead) {
                state = "RETURN";
                EnemySetAnimation(sprEnemyHeavyWalk, 0.15);
            }
            else {
                // The player is near the enemy so we chase the player
                state = "CHASE";
                EnemySetAnimation(sprEnemyHeavyWalk, 0.15);
            }
            hammer = false;
        }
        break;

    // State after chasing the player and returning to our original position
    case "RETURN":
        // Go back to our original position
        if (x > normalStateX) {
            xSpeed = -1.6;
            image_xscale = -1;
        }
        else if (x < normalStateX) {
            xSpeed = 1.6;
            image_xscale = 1;
        }

        // Check if we are on the previous position before chasing the player
        if (floorto(x, 4) == floorto(normalStateX, 4)) {
            // Start patrolling
            state = "NORMAL";
        }
        break;
}

// Apply invincibility
EnemyInvincibility();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw

event_inherited()
