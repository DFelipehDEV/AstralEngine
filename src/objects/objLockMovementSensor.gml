#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
targetX = -1;
minSpeed = 2.25;
lockTime = 0; // Frames to remain locked after reaching the target position

active = false;
reached = false;
player = noone;
walkDir = 1;
actualTargetX = 0;
lockTimer = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Safety cleanup
if (instance_exists(player)) {
    player.allowKeys = true;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle active state
if (active) {
    if (!instance_exists(player)) {
        instance_destroy();
        exit;
    }

    // Keep keys locked
    player.allowKeys = false;
    with (player) {
        PlayerResetKeys();
    }

    if (!reached) {
        // Keep normal state if grounded
        if (player.ground && player.state != PlayerStateNormal) {
            with (player) {
                StatesSet(PlayerStateNormal);
            }
        }

        // Maintain speed towards target X
        if (walkDir != 0) {
            if (sign(player.xSpeed) != walkDir || abs(player.xSpeed) < minSpeed) {
                player.xSpeed = walkDir * minSpeed;
            }
            player.xDirection = walkDir;
        }
    } else {
        // Player is stopped at target position waiting for lock timer
        player.xSpeed = 0;
        lockTimer = max(lockTimer - global.timeScale, 0);

        if (lockTimer <= 0) {
            player.allowKeys = true;
            instance_destroy();
            exit;
        }
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle Collision & Position Arrival
var _player;

// Check for player entering sensor
if (!active) {
    _player = instance_place(x, y, objPlayer);
    if (_player != noone) {
        active = true;
        player = _player;

        actualTargetX = x + targetX;
        walkDir = sign(actualTargetX - player.x);
        lockTimer = lockTime;

        // Lock movement
        player.allowKeys = false;
        with (player) {
            PlayerResetKeys();
            if (boosting) {
                boosting = false;
                canBoost = false;
                PlayerSetPhysicsMode(physicsMode);
            }
            if (ground && state != PlayerStateNormal) {
                StatesSet(PlayerStateNormal);
            }
        }

        // Apply speed: maintain if above minSpeed in same direction, otherwise set to minSpeed
        if (walkDir != 0) {
            if (sign(player.xSpeed) == walkDir && abs(player.xSpeed) >= minSpeed) {
                // Keep current speed
            } else {
                player.xSpeed = walkDir * minSpeed;
            }
            player.xDirection = walkDir;
        } else {
            player.xSpeed = 0;
        }
    }
}

// Check if player reached target position (accounting only for X)
if (active && !reached) {
    if (instance_exists(player)) {
        var _hasReached;
        _hasReached = false;

        if (walkDir == 1) {
            if (player.x >= actualTargetX) _hasReached = true;
        } else if (walkDir == -1) {
            if (player.x <= actualTargetX) _hasReached = true;
        } else {
            _hasReached = true;
        }

        if (_hasReached) {
            player.x = actualTargetX;
            player.xSpeed = 0;
            with (player) {
                AnimationApply("IDLE");
            }
            reached = true;
            lockTimer = lockTime;

            if (lockTimer <= 0) {
                player.allowKeys = true;
                instance_destroy();
                exit;
            }
        }
    } else {
        instance_destroy();
        exit;
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
/*preview
*/
//field targetX: number
//field minSpeed: number
//field lockTime: number

if (targetX == -1) {
    targetX = sprite_width / 2;
}