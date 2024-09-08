/// PlayerStateLookup()

// Reset
if (!keyUp || keyDown) {
    // Skip frames to reset faster
    if (!keyUp && animationFrame > 2) {
        animationFrame = 2;
    }
    animationFrame = max(animationFrame - 0.3, animationStartFrame);

    if (floor(animationFrame) == 0) {
        PlayerSetState(PlayerStateNormal);
    }
}

if (ground)
    PlayerJump();
