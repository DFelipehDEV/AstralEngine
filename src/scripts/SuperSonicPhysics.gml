/// SuperSonicPhysics()
if (physicsMode == PhysicsNormal) {
    if (!boosting) {
        xTopSpeed = 12;
        xMaxSpeed = 13.2;
        xAcceleration = 0.11;
        xAirAcceleration = 0.14;
        xFriction = 0.09;
    } else {
        xTopSpeed = 14.04;
        xMaxSpeed = 14.04;
        xAcceleration = 0.18;
        xAirAcceleration = 0.2;
        xFriction = 0.09;
    }

    yGravity = 0.235;
    jumpStrength = -7.7;
}

if (physicsMode == PhysicsWater) {
    if (!boosting) {
        xTopSpeed = 9.984;
        xMaxSpeed = 12;
        xAcceleration = 0.078;
        xAirAcceleration = 0.05;
        xFriction = 0.09;
    } else {
        xTopSpeed = 12.78;
        xMaxSpeed = 14.04;
        xAcceleration = 0.18;
        xAirAcceleration = 0.16;
        xFriction = 0.09;
    }

    yGravity = 0.12;
    jumpStrength = -6;
}
