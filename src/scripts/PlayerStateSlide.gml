/// PlayerStateSlide()
if (stateEntering) {
    slideCancelTimer = 35;
    AnimationApply("SLIDE");
    exit;
}

if (stateExiting) {
    audio_stop(sndPlayerSlide);
    exit;
}
animationSpeed = 0.2 + abs(xSpeed)/18;

if (distance_to_object(objSlidepassSensor) > 15) {
    // Decelerate while going to the left
    if (xSpeed < 0) {
        xSpeed += slideFriction;
    }

    // Decelerate while going to the right
    if (xSpeed > 0) {
        xSpeed -= slideFriction;
    }

    // Decrease reset timer if is not holding the slide key
    if (!keyDown && slideCancelTimer > 0) {
        slideCancelTimer -= 1;
    }

    // Back to the normal state if the player stopped or is not in the ground anymore
    if (!ground || floor(xSpeed) == 0 || !keyDown && slideCancelTimer == 0) {
        StatesSet(PlayerStateNormal);
    }
}
else {
    allowKeysTimer = 15;
}

// Create dust effect
if (alarm[0] == -1) {
    alarm[0] = 3;
}


// Physics
if (sign(xSpeed) == sign(angleSin)) {
    xSpeed -= rollUphillFriction * angleSin;
}

if (sign(xSpeed) != sign(angleSin)) {
    xSpeed -= rollDownhillForce * angleSin;
}

if (ground) {
    PlayerJump();
}

xDirection = esign(xSpeed, xDirection);
