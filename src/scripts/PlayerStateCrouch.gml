/// PlayerStateCrouch()

// Reset
if (!keyDown || keyUp) {
    animationFrame = max(animationFrame - 0.25, animationFrameStart);
    animationFrameSpeed = 0;
    if (animationFrame <= 0.25) {
        PlayerSetState(PlayerStateNormal);
    }
}
else {
    // Spindash!
    if (keyActionPressed) {
        PlayerSetState(PlayerStateSpindash);

        // Create charge effect
        with (instance_create(x, y, objSpindashCharge)) {
            image_blend = other.trailColor;
            image_xscale = 0.47;
            image_yscale = 0.47;
        }

        PlaySound("snd/PlayerSpindashCharge");
    }
}
