/// PlayerXMovement()

    var _xAcceleration, _xDeceleration, _xFriction;
    if (ground || state == PlayerStateCorkscrew) {
        _xAcceleration = xAcceleration * global.timeScale;
        _xDeceleration = xDeceleration * global.timeScale;
        _xFriction = (xDeceleration * 1.7) * global.timeScale;
    }
    else {
        _xAcceleration = (xAcceleration * 1.2) * global.timeScale;
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
