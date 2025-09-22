/// PlayerStateHomingFlight()
if (stateEntering) {
    AnimationApply(choose("HOMED", "HOMED_2", "SPRING_TRICK_VERTICAL"));
    allowKeysTimer = 20;
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();

xDirection = esign(xSpeed, xDirection);

if (ground) {
    StatesSet(PlayerStateNormal);
}
PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();
PlayerLightspeed();
PlayerBoost(true);
