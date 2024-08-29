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
action = PlayerActionNormal;
nearPlayer = 0;            //Checks if the player is near of the enemy

enemyBust = true;

enemyHP= noone;
enemyHPMax = noone;


shootTimer = 80;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset timer

turnTimer = turnTimerTemp;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start following the player

nearPlayer = true;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shoot

// Release projectile
if (action == PlayerActionNormal) {
    xSpeed = 0;

    shootTimer = 80;

    var _ownerID;
    _ownerID = instance_nearest(x, y, objPlayer);
    // Create projectile
    proj = instance_create(x + 9 * image_xscale, y + 9, objProjectileBuzzer);
    proj.hspeed = 5 * dcos(point_direction(x, y, _ownerID.x, _ownerID.y));
    proj.vspeed = -5 * dsin(point_direction(x, y, _ownerID.x, _ownerID.y));

    PlaySound("snd/Shot");
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (sprite_index != sprEnemyBuzzerAttack) {
    x += xSpeed;
    y += ySpeed;
}

if (action == PlayerActionNormal && !place_meeting(x, y, objEnemyTurn) && global.player) {
    ownerID = instance_nearest(x, y, objPlayer);
    xSpeed = 2 * image_xscale;

    // Trigger shot
    if (distance_to_object(ownerID) < 235 && sign(ownerID.x - x) == image_xscale) {
        if (shootTimer > 0) {
            shootTimer -= 1;
        }
        else {
            if (alarm[2] == -1 && nearPlayer) {
                alarm[2] = 20;
            }
        }

        // Warn enemy
        if (!nearPlayer) {
            nearPlayer = true;
            PlaySound("snd/EnemyWarn");
            DummyEffectCreate(x - 15 * image_xscale, y - 20, sprEnemyWarn, 0.2, 0, 1, bm_normal, 1, 1, 1, 0);
        }
    }
    else {
        nearPlayer = false;
    }
}

// Turn
// Check if the enemy is coliding the turn sensor
if (place_meeting(x, y, objEnemyTurn) && action == PlayerActionNormal) {
    // Turn
    if (turnTimer > 0) {
        turnTimer -= 1;
        xSpeed = 0;
    }
    else {
        if (alarm[0] == -1) {
            action = PlayerActionTurn;
        }
    }
}

// Apply invincibility
EnemyInvincibility();
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
if (action == PlayerActionNormal) {
    sprite_index = sprEnemyBuzzerMove;
    image_speed = 0.32;
}


// Attack animation
if (action == PlayerActionNormal && alarm[2] < 30 && alarm[2] > 0) {
    sprite_index = sprEnemyBuzzerAttack;
    image_speed = 0.15;
}


// Turn animation
if (action == PlayerActionTurn) {
    sprite_index = sprEnemyBuzzerTurn;
    image_speed = 0.25;
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Back to the normal action


if (action == PlayerActionTurn) {
    image_xscale = -image_xscale;
    action= PlayerActionNormal;
    xSpeed= 2.2 * image_xscale;
    if (alarm[0] == -1) {
        alarm[0] = 15;
    }
}
