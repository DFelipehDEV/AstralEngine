/// PlayerMoveX([xAcceleration], [xFriction], [xTopSpeed]])

var _xAcceleration, _xFriction, _xTopSpeed, _xBrakeFriction;
if (ground) {
    _xAcceleration = xAcceleration * global.timeScale;
    _xFriction = xFriction * global.timeScale;
    _xBrakeFriction = (xFriction * 1.7) * global.timeScale;
}
else {
    _xAcceleration = (xAcceleration * 1.2) * global.timeScale;
    _xFriction = 0;
    _xBrakeFriction = 0;
}
_xTopSpeed = xTopSpeed;

switch (argument_count) {
    case 3:
        _xTopSpeed = argument2;
    case 2:
        _xFriction = argument1;
    case 1:
        _xAcceleration = argument0;
        break;
}

// Apply horizontal movement based on player input
if (keyLeft != keyRight) {
    var dir;
    dir = keyRight - keyLeft;

    if (sign(xSpeed) != dir || abs(xSpeed) < _xTopSpeed) {
        xSpeed += _xAcceleration * dir;
    }

    if (sign(xSpeed) != dir) {
        xSpeed += _xBrakeFriction * dir;
    }
} else {
    xSpeed = approach(xSpeed, 0, _xFriction);
}
