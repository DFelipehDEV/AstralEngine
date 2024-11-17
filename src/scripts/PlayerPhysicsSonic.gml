/// PlayerPhysicsSonic()
// Normal physics
if (physicsMode == PhysicsNormal) {
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

    yAcceleration = 0.235;
    jumpStrength = -7.5;
}

// Water physics
if (physicsMode == PhysicsWater) {
    if (!boosting) {
        xSpeedTop = 7.2;
        xSpeedMax = 10;
        xAcceleration = 0.06;
        xDeceleration = 0.07;
    } else {
        xSpeedTop = 9.984;
        xSpeedMax = 12;
        xAcceleration = 0.078;
        xDeceleration = 0.09;
    }

    yAcceleration = 0.12;
    jumpStrength = -5.8;
}
