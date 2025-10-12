/// PlayerStateNormal()
if (stateEntering) {
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();

xDirection = PlayerGetInputDirection();

PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();
PlayerLightspeed();
PlayerBoost(true);

if (ground) {
    StatesSet(PlayerStateNormal);
}
