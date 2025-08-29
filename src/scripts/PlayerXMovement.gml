/// PlayerXMovement()

var _xAcceleration, _xFriction, _xBrakeFriction;
if (ground || state == PlayerStateCorkscrew) {
    _xAcceleration = xAcceleration * global.timeScale;
    _xFriction = xFriction * global.timeScale;
    _xBrakeFriction = (xFriction * 1.7) * global.timeScale;
}
else {
    _xAcceleration = (xAcceleration * 1.2) * global.timeScale;
    _xFriction = 0;
    _xBrakeFriction = 0;
}

// Acceleration
// Accelerate to the left
if (keyLeft && !keyRight) {
    if (xSpeed > -xTopSpeed) {
        xSpeed -= _xAcceleration;
    }

    // Friction
    if (xSpeed > 0) {
        xSpeed -= _xBrakeFriction;
    }
}
// Accelerate to the right
else
if (keyRight && !keyLeft) {
    if (xSpeed < xTopSpeed) {
        xSpeed += _xAcceleration;
    }

    // Friction
    if (xSpeed < 0) {
        xSpeed += _xBrakeFriction;
    }
}
else {
    xSpeed = approach(xSpeed, 0, _xFriction);
}
