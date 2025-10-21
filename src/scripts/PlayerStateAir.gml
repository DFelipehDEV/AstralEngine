/// PlayerStateAir([canBoost=true], [canAirdash=true], [canHomingAttack=true])
if (stateEntering) {
    canBoost = true;
    canAirdash = true;
    canHomingAttack = true;
    switch (argument_count) {
        case 3: canHomingAttack = argument2;
        case 2: canAirdash = argument1;
        case 1: canBoost = argument0; break;
    }
    exit;
}
if (stateExiting) {
    canBoost = true;
    canAirdash = true;
    canHomingAttack = true;
    exit;
}

PlayerMoveX();

xDirection = PlayerGetInputDirection();

PlayerHomingAttack();

PlayerAirdash();

PlayerStomp();
PlayerLightspeed();

if (canBoost)
    PlayerBoost(true);

if (ground) {
    StatesSet(PlayerStateNormal);
}
