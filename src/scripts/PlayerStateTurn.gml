/// PlayerStateTurn()

PlayerXMovement();
if (stateTimer > 8) {
    xDirection = -xDirection;
    PlayerSetState(PlayerStateNormal);
    PlayerAnimationNormal();
}
if (ground)
    PlayerJump();
