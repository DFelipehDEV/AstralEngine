/// PlayerStateBoostAir()
if (stateEntering) {
    boostAirTimer = 80;
    canBoost = true;
    AnimationApply("LAUNCH");
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();
if (ground) {
    StatesSet(PlayerStateNormal);
}

PlayerStomp();
