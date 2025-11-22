/// PlayerStateCrouch()
if (stateEntering) {
    AnimationApply("CROUCH");
    exit;
}
if (stateExiting) {
    exit;
}

// Reset
if (!keyDown || keyUp) {
    image_index = max(image_index - 0.25, 0);
    animationSpeed = 0;
    if (image_index <= 0.25) {
        StatesSet(PlayerStateNormal);
    }
}
else {
    // Spindash!
    if (keyActionPressed) {
        StatesSet(PlayerStateSpindash);

        // Create charge effect
        with (instance_create(x, y, objSpindashCharge)) {
            image_blend = other.trailColor;
            image_xscale = 0.47;
            image_yscale = 0.47;
        }

        PlaySound(sndPlayerSpindash);
    }
}
