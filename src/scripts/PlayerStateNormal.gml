/// PlayerStateNormal()
if (stateEntering) {
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();
// Check if we are in the ground
if (ground) {
    // Animation speed while moving on normal state
    if (((animation == "WALK" || animation == "WALK_2" || animation == "JOG"
    || animation == "JOG_2" || animation == "RUN"))) {
        animationSpeed = min(0.12 + abs(xSpeed)/28, 0.62);
    }

    // Turn!
    if (abs(xSpeed) < 1) {
        if ((xDirection == -1 && keyRight) || (xDirection == 1 && keyLeft)) {
            StatesSet(PlayerStateTurn);
            exit;
        }
    }

    // Check if we are standing still
    if (xSpeed == 0) {
        // Look up!
        if (!keyDown && keyUp) {
            StatesSet(PlayerStateLookup);
        }

        // Crouch!
        if (keyDown && !keyUp) {
            StatesSet(PlayerStateCrouch);
        }
    }

    // Skid!
    if ((xSpeed >= 4 && keyLeft) || (xSpeed <= -4 && keyRight)) {
        PlayerHandleFootstepSensors();
        StatesSet(PlayerStateSkid);
        PlaySound(terrainSound[TerSkid]);
    }

    // Slide!
    if (abs(xSpeed) > 1 && keyDown) {
        PlayVoice(choose(voiceline[3], voiceline[2]));
        StatesSet(PlayerStateSlide);

        PlaySound(sndPlayerSlide);
    }
}

xDirection = esign(xSpeed, xDirection);

if (state == PlayerStateNormal) {
    // Normal state animations
    PlayerAnimationNormal();
}
if (!ground)
    PlayerHomingAttack();
PlayerAirdash();
if (ground)
    PlayerJump();
PlayerStomp();
PlayerLightspeed();
PlayerBoost(true);
