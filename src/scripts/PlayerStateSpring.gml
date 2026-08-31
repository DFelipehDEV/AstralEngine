/// PlayerStateSpring()
if (stateEntering) {
    AnimationPlay("SPRING");
    exit;
}
if (stateExiting) {
    image_angle = 0;
    exit;
}

PlayerMoveX();
// Animations
if (animation != "FLING") {
    if (stateTimer < 30) {
        AnimationPlay("SPRING");
    } else {
        // Spring animation
        if (ySpeed < 0.2) {
            AnimationPlay("SPRING");
        } else { // Fall animation
            AnimationPlay("LANDING");
        }
    }
}

if (animation == "SPRING") {
    image_angle = point_direction(xprevious, yprevious, x, y)-90;
} else {
    xDirection = esign(xSpeed, xDirection);
}

if (hasSpringTrick && keyTrickPressed) {
    if (keyUp) {
        xSpeed = 0;
        ySpeed = -7;
        AnimationPlay("TRICK_VER");
    } else {
        xSpeed = 6 * PlayerGetInputDirection();
        ySpeed = -2;
        xDirection = sign(xSpeed);
        AnimationPlay("TRICK_HOR");
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
    if (ySpeed > 2) {
        PlaySound(terrainSound[TerLand]);
    }
}
