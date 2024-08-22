/// PlayerActionTurn()

PlayerXMovement();
if (animationFinished) {
    xDirection = -xDirection;
    PlayerSetAction(PlayerActionNormal);
    PlayerAnimationNormal();
}
if (ground)
    PlayerJump();
