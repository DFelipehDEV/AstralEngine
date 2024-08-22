/// PlayerPhysicModeSet(PhysicMode)
physicsMode = argument0;
script_execute(characterPhysics);
switch (physicsMode) {
    case PhysicsWater:
        if (shield == ShieldElectricity) {
            shield = ShieldNoone;
            instance_destroy_id(shieldInstance);
        }
        break;
}
