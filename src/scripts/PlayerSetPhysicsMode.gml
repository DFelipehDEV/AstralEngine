/// PlayerSetPhysicsMode(physicsMode)
physicsMode = argument0;
script_execute(characterPhysics);
switch (physicsMode) {
    case PhysicsWater:
        if (shield == objShieldElectricity) {
            PlayerSetShield(noone);
        }
        break;
}
