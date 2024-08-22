/// PlayerActionJump()

PlayerXMovement();
// Animations
// Change direction to the left if the left key have been pressed
if (keyLeft) {
    xDirection = -1;
}

// Change direction to the right if the right key have been pressed
if (keyRight) {
    xDirection = 1;
}

// Jump animation
if (ySpeed < 2.5) {
    AnimationApply("JUMP");
}

// Land animation
if (ySpeed > 4.5) {
    AnimationApply("LANDING");
}

// Animation speed
if (animationIndex != "LANDING") {
    animationFrameSpeed = (0.2 + abs(ySpeed)/7) + abs(xSpeed)/15;
}

// Variable jump
if (ySpeed < 0 && jumpAirTimer <= 13 && keyAction) {
    ySpeed += jumpStrength/(26);
    jumpAirTimer += 1;
}

// Air drag
if(ySpeed < 0 && ySpeed >= -4) {
   xSpeed -= ((xSpeed / 0.2) / 256);
}

if (global.playerRings >= 50 && keySpecial3Pressed && character == CharacterSonic) {
    PlayerSetAction(PlayerActionTransform);
    xSpeed = 0;
}

PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();
PlayerLightspeed();
PlayerBoost(true);

// Reset after touching the ground
if (ground) {
    PlayerSetAction(PlayerActionNormal);
}
