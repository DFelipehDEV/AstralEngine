/// PlayerActionNormal()

PlayerXMovement();
// Check if we are in the ground
if (ground) {
    // Animation speed while moving on normal action
    if (((animation == "WALK_1" || animation == "WALK_2" || animation == "JOG_1"
    || animation == "JOG_2" || animation == "RUN"))) {
        animationFrameSpeed = min(0.13 + abs(xSpeed)/25, 0.63);
    }

    // Turn!
    if (abs(xSpeed) < 1) {
        if ((xDirection == -1 && keyRight) || (xDirection == 1 && keyLeft)) {
            PlayerSetAction(PlayerActionTurn);
            exit;
        }
    }

    // Check if we are standing still
    if (xSpeed == 0) {
        // Look up!
        if (!keyDown && keyUp) {
            with (cam)
                CameraLag(20)
            PlayerSetAction(PlayerActionLookup);
        }

        // Crouch!
        if (keyDown && !keyUp) {
            with (cam)
                CameraLag(20)
            PlayerSetAction(PlayerActionCrouch);
        }
    }

    // Skid!
    if ((xSpeed >= 4 && keyLeft) || (xSpeed <= -4 && keyRight)) {
        PlayerTerrainSndUpdate();
        PlayerSetAction(PlayerActionSkid);
        PlaySound(terrainSound[TerSkid]);
    }

    // Slide!
    if (abs(xSpeed) > 1 && keyDown) {
        PlayVoice(choose(voiceline[3], voiceline[2]));
        PlayerSetAction(PlayerActionSlide);

        PlaySound("snd/PlayerSlide");
    }
}

xDirection = esign(xSpeed, xDirection);

if (action == PlayerActionNormal) {
    // Normal action animations
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
