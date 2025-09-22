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

if (keySpecial1Pressed) {
    if (!keyUp && (keyLeft || keyRight)) {
        // Horizontal
        var _dir;
        _dir = (keyRight - keyLeft);
        xSpeed = 6 * _dir;
        ySpeed = -2;
        xDirection = _dir;
        AnimationApply("SPRING_TRICK_HORIZONTAL");
    } else if (keyUp && !keyLeft && !keyRight) {
        // Vertical
        xSpeed = 0;
        ySpeed = -7;
        AnimationApply("SPRING_TRICK_VERTICAL");
    }
    StatesSet(PlayerStateSpringTrick);
}

PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();

// Reset after touching the ground
if (ground) {
    StatesSet(PlayerStateNormal);
}
