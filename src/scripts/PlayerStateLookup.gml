/// PlayerStateLookup()
if (stateEntering) {
    AnimationApply("LOOK_UP");
    exit;
}
if (stateExiting) {
    exit;
}

// Reset
if (!keyUp || keyDown) {
    // Skip frames to reset faster
    if (!keyUp && image_index > 2) {
        image_index = 2;
    }
    image_index = max(image_index - 0.3, animationStartFrame);

    if (floor(image_index) == 0) {
        StatesSet(PlayerStateNormal);
    }
}

if (ground)
    PlayerJump();
