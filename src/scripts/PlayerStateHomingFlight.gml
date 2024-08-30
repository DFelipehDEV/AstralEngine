/// PlayerStateHomingFlight()

PlayerXMovement();

xDirection = esign(xSpeed, xDirection);

if (ground) {
    PlayerSetState(PlayerStateNormal);
}
PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();
PlayerLightspeed();
PlayerBoost(true);
