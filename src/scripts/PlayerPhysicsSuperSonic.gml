/// PlayerPhysicsSuperSonic()
// Normal physics
if (physicsMode == PhysicsNormal) {
    if (!boosting) {
        xSpeedTop = 12;
        xSpeedMax = 14;
        xAcceleration = 0.11;
        xDeceleration = 0.09;
    }
    else {
        xSpeedTop = 15;
        xSpeedMax = 16;
        xAcceleration = 0.2;
        xDeceleration = 0.09;
    }

    yAcceleration = 0.24;
    jumpStrength = -7.7;
}

// Water physics
if (physicsMode == PhysicsWater) {
    if (!boosting) {
        xSpeedTop = 10;
        xSpeedMax = 12;
        xAcceleration = 0.062;
        xDeceleration = 0.06;
    }
    else {
        xSpeedTop = 12;
        xSpeedMax = 13;
        xAcceleration = 0.095;
        xDeceleration = 0.06;
    }

    yAcceleration = 0.12;
    jumpStrength = -6;
}
