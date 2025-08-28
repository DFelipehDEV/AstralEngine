/// PlayerPhysicsSonic()
// Normal physics
if (physicsMode == PhysicsNormal) {
    if (!boosting) {
        xTopSpeed = 9.984;
        xMaxSpeed = 12;
        xAcceleration = 0.078;
        xFriction = 0.09;
    } else {
        xTopSpeed = 12.78;
        xMaxSpeed = 14.04;
        xAcceleration = 0.18;
        xFriction = 0.09;
    }

    yGravity = 0.235;
    jumpStrength = -7.5;
}

// Water physics
if (physicsMode == PhysicsWater) {
    if (!boosting) {
        xTopSpeed = 7.2;
        xMaxSpeed = 10;
        xAcceleration = 0.06;
        xFriction = 0.07;
    } else {
        xTopSpeed = 9.984;
        xMaxSpeed = 12;
        xAcceleration = 0.078;
        xFriction = 0.09;
    }

    yGravity = 0.12;
    jumpStrength = -5.8;
}
