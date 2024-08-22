/// PlayerActionSpring()

PlayerXMovement();
// Animations
if (animationIndex != "SPRING_TRICK_HORIZONTAL" && animationIndex != "SPRING_TRICK_VERTICAL" && animationIndex != "FLING" && animationIndex != "LANDING" && animationIndex != "FALL") {
    // Spring animation
    if (ySpeed < 0.2) {
        AnimationApply("SPRING");
    }

    // Fall animation
    if (ySpeed >= 0.2) {
        AnimationApply("LANDING");
    }
}

if (animationIndex == "SPRING") {
    animationAngle = point_direction(xprevious, yprevious, x, y)-90;
}
else {
    xDirection = esign(xSpeed, xDirection);
}

// Spring tricks!
if (keySpecial1Pressed && (animationIndex == "SPRING" || animationIndex == "LANDING")) {
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
        PlaySound("sndPlayerSpringTrick");
        animationAngle = 0;
    }


    // Vertical trick
    if (!keyLeft && !keyRight && keyUp) {
        xSpeed = 0;
        ySpeed = -7;

        AnimationApply("SPRING_TRICK_VERTICAL")
        PlaySound("sndPlayerSpringTrick");
        animationAngle = 0;
    }
}

PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();

// Reset after touching the ground
if (ground) {
    PlayerSetAction(PlayerActionNormal);
}
