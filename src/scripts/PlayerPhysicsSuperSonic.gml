/// PlayerPhysicsSuperSonic()
// Normal physics
if (physicsMode == PhysicsNormal) {
    if (!boosting) {
        xTopSpeed = 12;
        xMaxSpeed = 13.2;
        xAcceleration = 0.11;
        xFriction = 0.09;
    } else {
        xTopSpeed = 14.04;
        xMaxSpeed = 14.04;
        xAcceleration = 0.18;
        xFriction = 0.09;
    }

    yGravity = 0.235;
    jumpStrength = -7.7;
}

// Water physics
if (physicsMode == PhysicsWater) {
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

    yGravity = 0.12;
    jumpStrength = -6;
}
