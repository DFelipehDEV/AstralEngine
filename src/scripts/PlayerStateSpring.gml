/// PlayerStateSpring()

PlayerMoveX();
// Animations
if (animation != "SPRING_TRICK_HORIZONTAL" && animation != "SPRING_TRICK_VERTICAL" && animation != "FLING" && animation != "LANDING" && animation != "FALL") {
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

// Spring tricks!
if (keySpecial1Pressed && (animation == "SPRING" || animation == "LANDING")) {
    // Horizontal trick
    if (!keyUp && (keyLeft || keyRight)) {
        if (keyLeft && !keyRight) {
            xSpeed = -6;
        }

        if (!keyLeft && keyRight) {
            xSpeed = 6;
        }
        ySpeed = -2;

        AnimationApply("SPRING_TRICK_HORIZONTAL")
        PlaySound(sndPlayerTrick);
        image_angle = 0;
    }


    // Vertical trick
    if (!keyLeft && !keyRight && keyUp) {
        xSpeed = 0;
        ySpeed = -7;

        AnimationApply("SPRING_TRICK_VERTICAL")
        PlaySound(sndPlayerTrick);
        image_angle = 0;
    }
}

PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();

// Reset after touching the ground
if (ground) {
    PlayerSetState(PlayerStateNormal);
}
