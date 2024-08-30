/// PlayerActionHurt()

// Check if the player has landed
if (ground) {
    // Back to the normal action
    xSpeed = 0;
    invincibility = InvincibilityBlink;
    invincibilityTimer = 170;
    PlayerSetAction(PlayerActionNormal);
}
