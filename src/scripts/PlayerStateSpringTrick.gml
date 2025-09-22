/// PlayerStateSpring()
if (stateEntering) {
    PlaySound(sndPlayerTrick);
    image_angle = 0;
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();

PlayerHomingAttack();
PlayerStomp();

if (ground) {
    StatesSet(PlayerStateNormal);
}
