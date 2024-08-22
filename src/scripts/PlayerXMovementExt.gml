/// PlayerXMovementExt(xAcceleration, xDeceleration, xSpeedTop)

    var _xAcceleration, _xDeceleration, _xFriction, _xSpeedTop;
    _xAcceleration = argument0 * global.deltaMultiplier;
    _xDeceleration = argument1 * global.deltaMultiplier;
    _xFriction = (argument1 * 1.7) * global.deltaMultiplier;
    _xSpeedTop = argument2;

    // Acceleration
    // Accelerate to the left
    if (keyLeft && !keyRight) {
        if xSpeed > -_xSpeedTop {
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
        if xSpeed < _xSpeedTop {
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
