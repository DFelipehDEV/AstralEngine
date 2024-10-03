/// PlayerStateNormal()

PlayerXMovement();
// Check if we are in the ground
if (ground) {
    // Animation speed while moving on normal state
    if (((animation == "WALK" || animation == "WALK_2" || animation == "JOG"
    || animation == "JOG_2" || animation == "RUN"))) {
        animationSpeed = min(animationSpeed + abs(xSpeed)/25, 0.73);
    }

    // Turn!
    if (abs(xSpeed) < 1) {
        if ((xDirection == -1 && keyRight) || (xDirection == 1 && keyLeft)) {
            PlayerSetState(PlayerStateTurn);
            exit;
        }
    }

    // Check if we are standing still
    if (xSpeed == 0) {
        // Look up!
        if (!keyDown && keyUp) {
            with (cam)
                CameraLag(20)
            PlayerSetState(PlayerStateLookup);
        }

        // Crouch!
        if (keyDown && !keyUp) {
            with (cam)
                CameraLag(20)
            PlayerSetState(PlayerStateCrouch);
        }
    }

    // Skid!
    if ((xSpeed >= 4 && keyLeft) || (xSpeed <= -4 && keyRight)) {
        PlayerTerrainSndUpdate();
        PlayerSetState(PlayerStateSkid);
        PlaySound(terrainSound[TerSkid]);
    }

    // Slide!
    if (abs(xSpeed) > 1 && keyDown) {
        PlayVoice(choose(voiceline[3], voiceline[2]));
        PlayerSetState(PlayerStateSlide);

        PlaySound("snd/PlayerSlide");
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
