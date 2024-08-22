/// PlayerActionCrouch()

// Reset
if (!keyDown || keyUp) {
    animationFrame = max(animationFrame - 0.25, animationFrameStart);
    animationFrameSpeed = 0;
    if (animationFrame <= 0.25) {
        PlayerSetAction(PlayerActionNormal);
    }
}
else {
    // Spindash!
    if (keyActionPressed) {
        PlayerSetAction(PlayerActionSpindash);

        // Create charge effect
        with (instance_create(x, y, objVFXSpindashCharge)) {
            image_blend = other.trailColor;
            image_xscale = 0.47;
            image_yscale = 0.47;
        }

        PlaySound("sndPlayerSpindashCharge");
    }
}
