/// PlayerActionHomingFlight()

PlayerXMovement();

xDirection = esign(xSpeed, xDirection);

if (ground) {
    PlayerSetAction(PlayerActionNormal);
}
PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();
PlayerLightspeed();
PlayerBoost(true);
