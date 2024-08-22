/// PlayerActionSlide()

// Animation speed
animationFrameSpeed = 0.2 + abs(xSpeed)/18;

if (distance_to_object(objSlidepassSensor) > 15) {
    // Decelerate while going to the left
    if (xSpeed < 0) {
        xSpeed += slideDeceleration;
    }

    // Decelerate while going to the right
    if (xSpeed > 0) {
        xSpeed -= slideDeceleration;
    }

    // Decrease reset timer if is not holding the slide key
    if (!keyDown && slideResetTimer > 0) {
        slideResetTimer -= 1;
    }

    // Back to the normal action if the player stopped or is not in the ground anymore
    if (!ground || floor(xSpeed) == 0 || !keyDown && slideResetTimer == 0) {
        PlayerSetAction(PlayerActionNormal);
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
    xSpeed -= rollDecelerationSlopeUp * angleSin;
}

if (sign(xSpeed) != sign(angleSin)) {
    xSpeed -= rollDecelerationSlopeDown * angleSin;
}

if (ground) {
    PlayerJump();
}

xDirection = esign(xSpeed, xDirection);
