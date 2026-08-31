/// PlayerSetPhysicsMode(physicsMode)
physicsMode = argument0;
script_execute(characterPhysics);
switch (physicsMode) {
    case PhysicsWater:
        if (instance_exists(shieldInstance)) {
            if (shieldInstance.destroyInWater) {
                PlayerSetShield(noone);
            }
        }
        break;
}
