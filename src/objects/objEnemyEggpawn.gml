#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

event_inherited();

turnTimer = 30;           //How long it takes to turn
turnTimerTemp = turnTimer;    //Keep the original value on track
state = "NORMAL";
target = noone;

delay = 0;

knockOnDeath = true;

EnemySetAnimation(sprEnemyEggpawnWalk, 0.2);

normalStateX = x;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start chasing the player

state = "CHASE";
EnemySetAnimation(sprEnemyEggpawnRun, 0.3);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

BodyApplyGravity(0.2);
move_and_collide(xSpeed, ySpeed, objTerrain);

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

switch (state) {
    case "TURN":
        // If the turn timer is not expired, pause the enemy's movement
        if (turnTimer > 0) {
            turnTimer -= 1;
            xSpeed = 0;
        }
        else {
            EnemySetAnimation(sprEnemyEggpawnTurn, 0.2);
            if (image_index >= 1.9) {
                image_xscale = -image_xscale;
                state = "NORMAL";
                EnemySetAnimation(sprEnemyEggpawnWalk, 0.2);
            }
        }
    break;

    case "NORMAL":
        normalStateX = x;
        // Walk at normal speed
        xSpeed = 1.6 * image_xscale;

        var _nearPlayer;
        _nearPlayer = instance_nearest(x, y, objPlayer);

        // Check if the player is near the enemy
        if (distance_to_object(_nearPlayer) < 100) {
            // Check if the enemy is looking at the player
            if (image_xscale == sign(_nearPlayer.x - x)) {
                state = "SPOTTED";
                target = _nearPlayer;
                EnemySetAnimation(sprEnemyEggpawnIdle, 0.2);
            }
        }
        
        // Check if the enemy is coliding the turn sensor
        if (place_meeting(x, y, objEnemyTurn) && !place_meeting(xprevious, yprevious, objEnemyTurn)) {
            turnTimer = turnTimerTemp;
            xSpeed = 0;
            state = "TURN";
            EnemySetAnimation(sprEnemyEggpawnIdle, 0.2);
        }
    break;

    case "SPOTTED":
        xSpeed = lerp(xSpeed, 0, 0.12);

        if (alarm[1] == -1) {
            alarm[1] = 20;
            PlaySound(sndEnemyWarn);
            DummyEffectCreate(x - 10 * image_xscale, y - 25, sprEnemyWarn, 0.25, 0, 1, bm_normal, 1, 1,1, 0);
        }
    break;

    case "CHASE":
        xSpeed = 4.5 * image_xscale;

        // If the player is too far away or too close to the enemy's turn sensor, switch to the normal state.
        if ((distance_to_object(target) > 140 || distance_to_object(target) <= 140 && image_xscale != sign(target.x - x)) || abs(x - normalStateX) > 350) {
            state = "RETURN";
            target = noone;
            EnemySetAnimation(sprEnemyEggpawnWalk, 0.2);
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
            // Start patroling
            state = "NORMAL";
        }
    break;
}

x = clamp(x, objCamera.leftBorder, objCamera.rightBorder);
