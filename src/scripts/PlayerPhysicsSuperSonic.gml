/// PlayerPhysicsSuperSonic()
// Normal physics
if (physicsMode == PhysicsNormal) {
    if (!boosting) {
        xSpeedTop = 12;
        xSpeedMax = 13.2;
        xAcceleration = 0.11;
        xDeceleration = 0.09;
    } else {
        xSpeedTop = 14.04;
        xSpeedMax = 14.04;
        xAcceleration = 0.18;
        xDeceleration = 0.09;
    }

    yAcceleration = 0.24;
    jumpStrength = -7.7;
}

// Water physics
if (physicsMode == PhysicsWater) {
    if (!boosting) {
        xSpeedTop = 9.984;
        xSpeedMax = 12;
        xAcceleration = 0.078;
        xDeceleration = 0.09;
    } else {
        xSpeedTop = 12.78;
        xSpeedMax = 14.04;
        xAcceleration = 0.18;
        xDeceleration = 0.09;
    }

    yAcceleration = 0.12;
    jumpStrength = -6;
}
