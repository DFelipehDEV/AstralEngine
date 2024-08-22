/// PlayerActionRoll()

animationFrameSpeed = 0.2 + abs(xSpeed)/17;

if (distance_to_object(objSlidepassSensor) > 15) {
    // Check if is going to the right
    if (xSpeed > 0) {
        // Decelerate depending on what are you pressing
        if (keyLeft) {
            xSpeed -= rollDecelerationFric;
        }
        else {
            xSpeed -= rollDeceleration;
        }

        // Set the xSpeed to 0 if it got lower than 0 and back to the normal state
        if (xSpeed <= 0) {
            xSpeed = 0;
            PlayerSetAction(PlayerActionNormal);
        }
    }
    // Check if is going to the left
    else
    if (xSpeed < 0) {
        // Decelerate depending on what are you pressing
        if (keyRight) {
            xSpeed += rollDecelerationFric;
        }
        else {
            xSpeed += rollDeceleration;
        }
    }
}
else {
    allowKeysTimer = 15;
}


// Physics
if (sign(xSpeed) == sign(angleSin)) {
    xSpeed -= rollDecelerationSlopeUp * angleSin;
}

if (sign(xSpeed) != sign(angleSin)) {
    xSpeed -= rollDecelerationSlopeDown * angleSin;
}


// Stop rolling
if (floor(xSpeed) == 0) {
    PlayerSetAction(PlayerActionNormal);
}

if (keySpecial1Pressed) {
    PlayerSetAction(PlayerActionNormal);
}


// Set the jump action if is not in the ground anymore
if (!ground) {
    PlayerSetAction(PlayerActionJump);
}

if (ground)
    PlayerJump();

PlayerBoost();

xDirection = esign(xSpeed, xDirection);
