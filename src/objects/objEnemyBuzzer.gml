#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

event_inherited();

xSpeed = 0;
ySpeed = 0;

turnTimer = 20;           //How long it takes to turn
turnTimerTemp = turnTimer;    //Keep the original value on track
state = "NORMAL";
target = noone;

shootTimer = 80;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset timer

turnTimer = turnTimerTemp;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shoot

// Release projectile
if (state == "NORMAL" && instance_exists(target)) {
    xSpeed = 0;

    shootTimer = 80;

    // Create projectile
    proj = instance_create(x + 9 * image_xscale, y + 9, objProjectileBuzzer);
    proj.hspeed = 5 * dcos(point_direction(x, y, target.x, target.y));
    proj.vspeed = -5 * dsin(point_direction(x, y, target.x, target.y));

    PlaySound(sndShot);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (canMove && sprite_index != sprEnemyBuzzerAttack) {
    x += xSpeed;
    y += ySpeed;
}

if (state == "NORMAL" && !place_meeting(x, y, objEnemyTurn)) {
    if (canMove) {
        xSpeed = 2 * image_xscale;
    }

    // Trigger shot
    if (distance_to_object(objPlayer) < 235 && sign(objPlayer.x - x) == image_xscale) {
        if (shootTimer > 0) {
            shootTimer -= 1;
        } else {
            if (alarm[2] == -1 && target) {
                alarm[2] = 20;
            }
        }

        // Warn enemy
        if (target == noone) {
            target = instance_nearest(x, y, objPlayer);
            PlaySound(sndEnemyWarn);
            DummyEffectCreate(x - 15 * image_xscale, y - 20, sprEnemyWarn, 0.2, 0, 1, bm_normal, 1, 1, 1, 0);
        }
    }
    else {
        target = noone;
    }
}

// Turn
// Check if the enemy is coliding the turn sensor
if (place_meeting(x, y, objEnemyTurn) && state == "NORMAL") {
    // Turn
    if (turnTimer > 0) {
        turnTimer -= 1;
        xSpeed = 0;
    }
    else {
        if (alarm[0] == -1) {
            state = "TURN";
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animations

// Direction
if (xSpeed > 0) {
    image_xscale = 1;
}

if (xSpeed < 0) {
    image_xscale = -1;
}

// Animations
// Move animation
if (state == "NORMAL") {
    sprite_index = sprEnemyBuzzerMove;
    image_speed = 0.32;
}


// Attack animation
if (state == "NORMAL" && alarm[2] < 30 && alarm[2] > 0) {
    sprite_index = sprEnemyBuzzerAttack;
    image_speed = 0.15;
}


// Turn animation
if (state == "TURN") {
    sprite_index = sprEnemyBuzzerTurn;
    image_speed = 0.25;
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Back to the normal state

if (state == "TURN") {
    image_xscale = -image_xscale;
    state = "NORMAL";
    xSpeed = 2.2 * image_xscale;
    if (alarm[0] == -1) {
        alarm[0] = 15;
    }
}
