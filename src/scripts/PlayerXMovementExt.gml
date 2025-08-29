/// PlayerXMovementExt(xAcceleration, xFriction, xTopSpeed)

var _xAcceleration, _xFriction, _xBrakeFriction, _xTopSpeed;
_xAcceleration = argument0 * global.timeScale;
_xFriction = argument1 * global.timeScale;
_xBrakeFriction = (argument1 * 1.7) * global.timeScale;
_xTopSpeed = argument2;

// Acceleration
// Accelerate to the left
if (keyLeft && !keyRight) {
    if (xSpeed > -_xTopSpeed) {
        xSpeed -= _xAcceleration;
    }

    // Friction
    if (xSpeed > 0){
        xSpeed -= _xBrakeFriction;
    }
}
// Accelerate to the right
else
if (keyRight && !keyLeft) {
    if (xSpeed < _xTopSpeed) {
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
