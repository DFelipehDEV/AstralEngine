/// PlayerPhysicsSonic()
// Normal physics
if (physicsMode == PhysicsNormal) {
    if (!boosting) {
        xSpeedTop = 10;
        xSpeedMax = 12;
        xAcceleration = 0.081;
        xDeceleration = 0.09;
    }
    else {
        xSpeedTop = 13.7;
        xSpeedMax = 15.1;
        xAcceleration = 0.188;
        xDeceleration = 0.09;
    }

    yAcceleration = 0.24;
    jumpStrength = -7.5;
}

// Water physics
if (physicsMode == PhysicsWater) {
    if (!boosting) {
        xSpeedTop = 6;
        xSpeedMax = 10;
        xAcceleration = 0.062;
        xDeceleration = 0.06;
    }
    else {
        xSpeedTop = 10.3;
        xSpeedMax = 12;
        xAcceleration = 0.095;
        xDeceleration = 0.06;
    }

    yAcceleration = 0.12;
    jumpStrength = -5.8;
}
