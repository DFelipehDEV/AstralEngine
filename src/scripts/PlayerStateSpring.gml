/// PlayerStateSpring()
if (stateEntering) {
    AnimationApply("SPRING");
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();
// Animations
if (animation != "FLING" && animation != "LANDING" && animation != "FALL") {
    if (stateTimer < 15) {
        AnimationApply("SPRING");
    } else {
        // Spring animation
        if (ySpeed < 0.2) {
            AnimationApply("SPRING");
        } else { // Fall animation
            AnimationApply("LANDING");
        }
    }
}

if (animation == "SPRING") {
    image_angle = point_direction(xprevious, yprevious, x, y)-90;
} else {
    xDirection = esign(xSpeed, xDirection);
}

if (keyBoostPressed) {
    if (keyUp) {
        xSpeed = 0;
        ySpeed = -7;
        AnimationApply("SPRING_TRICK_VERTICAL");
    } else {
        xSpeed = 6 * PlayerGetInputDirection();
        ySpeed = -2;
        xDirection = sign(xSpeed);
        AnimationApply("SPRING_TRICK_HORIZONTAL");
    }

    PlaySound(sndPlayerTrick);
    image_angle = 0;
    StatesSet(PlayerStateAir, false, false);
}

PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();

// Reset after touching the ground
if (ground) {
    StatesSet(PlayerStateNormal);
}
