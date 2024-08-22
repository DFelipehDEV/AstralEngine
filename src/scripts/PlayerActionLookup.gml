/// PlayerActionLookup()

// Reset
if (!keyUp || keyDown) {
    // Skip frames to reset faster
    if (!keyUp && animationFrame > 2) {
        animationFrame = 2;
    }
    animationFrame = max(animationFrame - 0.3, animationFrameStart);

    if (floor(animationFrame) == 0) {
        PlayerSetAction(PlayerActionNormal);
    }
}

if (ground)
    PlayerJump();
