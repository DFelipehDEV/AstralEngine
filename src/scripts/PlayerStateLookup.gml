/// PlayerStateLookup()

// Reset
if (!keyUp || keyDown) {
    // Skip frames to reset faster
    if (!keyUp && image_index > 2) {
        image_index = 2;
    }
    image_index = max(image_index - 0.3, animationStartFrame);

    if (floor(image_index) == 0) {
        PlayerSetState(PlayerStateNormal);
    }
}

if (ground)
    PlayerJump();
