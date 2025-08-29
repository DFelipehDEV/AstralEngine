/// PlayerStateRoll()

animationSpeed = 0.2 + abs(xSpeed)/17;

if (distance_to_object(objSlidepassSensor) > 15) {
    // Check if is going to the right
    if (xSpeed > 0) {
        // Decelerate depending on what are you pressing
        if (keyLeft) {
            xSpeed -= rollBrakeFriction;
        }
        else {
            xSpeed -= rollFriction;
        }

        // Set the xSpeed to 0 if it got lower than 0 and back to the normal state
        if (xSpeed <= 0) {
            xSpeed = 0;
            PlayerSetState(PlayerStateNormal);
        }
    }
    // Check if is going to the left
    else
    if (xSpeed < 0) {
        // Decelerate depending on what are you pressing
        if (keyRight) {
            xSpeed += rollBrakeFriction;
        }
        else {
            xSpeed += rollFriction;
        }
    }
}
else {
    allowKeysTimer = 15;
}


// Physics
if (sign(xSpeed) == sign(angleSin)) {
    xSpeed -= rollUphillFriction * angleSin;
}

if (sign(xSpeed) != sign(angleSin)) {
    xSpeed -= rollDownhillForce * angleSin;
}


// Stop rolling
if (floor(xSpeed) == 0) {
    PlayerSetState(PlayerStateNormal);
}

if (keySpecial1Pressed) {
    PlayerSetState(PlayerStateNormal);
}


// Set the jump state if is not in the ground anymore
if (!ground) {
    PlayerSetState(PlayerStateJump);
}

if (ground)
    PlayerJump();

PlayerBoost();

xDirection = esign(xSpeed, xDirection);
