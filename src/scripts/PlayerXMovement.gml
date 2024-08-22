/// PlayerXMovement()

    var _xAcceleration, _xDeceleration, _xFriction;
    if (ground || action == PlayerActionCorkscrew) {
        _xAcceleration = xAcceleration * global.deltaMultiplier;
        _xDeceleration = xDeceleration * global.deltaMultiplier;
        _xFriction = (xDeceleration * 1.7) * global.deltaMultiplier;
    }
    else {
        _xAcceleration = (xAcceleration * 1.2) * global.deltaMultiplier;
        _xDeceleration = 0;
        _xFriction = 0;
    }

    // Acceleration
    // Accelerate to the left
    if (keyLeft && !keyRight) {
        if xSpeed > -xSpeedTop {
            xSpeed -= _xAcceleration;
        }

        // Friction
        if xSpeed > 0 {
            xSpeed -= _xFriction;
        }
    }
    // Accelerate to the right
    else
    if (keyRight && !keyLeft) {
        if xSpeed < xSpeedTop {
            xSpeed += _xAcceleration;
        }

        // Friction
        if xSpeed < 0 {
            xSpeed += _xFriction;
        }
    }
    else {
        // Decelerate when you are not pressing the right or left key
        xSpeed = approach(xSpeed, 0, _xDeceleration);
    }
