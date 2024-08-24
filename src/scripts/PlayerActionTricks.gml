/// PlayerActionTricks()

afterimageTime = 15;
if (animationIndex == "SPRING") {
    animationAngle = point_direction(xprevious, yprevious, x, y)-90;
}

// Check if the delay has ended
if (allowKeysTimer == 0) {
    // Trigger trick
    if (keyLeft || keyRight || keyUp || keyDown) {
        allowKeysTimer = 20;

        // Increase combo amount
        if (trickCombo < 9) {
            trickCombo += 1;
        }

        animationFrame = 0;
        AnimationApply(choose("HOMED_1", "HOMED_2", "SPRING_TRICK_HORIZONTAL", "SPRING_TRICK_VERTICAL"));

        // Get energy
        PlayerAddEnergy(7);

        // Create rainbow effect
        instance_create(x, y, objVFXRainbow);

        PlaySoundExt("snd/Trick", global.volumeSounds, 1 + (trickCombo * 0.0441), 0);

        if (global.deltaMultiplier == 0.4) {
            global.deltaMultiplier = 1;
        }
    }
}

// Finish trick
if (keySpecial3Pressed) {
    trickCombo = 0;
    PlayerAddEnergy(21);

    PlayerSetAction(PlayerActionSpring);
    AnimationApply("SPRING_TRICK_HORIZONTAL");

    global.deltaMultiplier = 1;
    PlaySound("snd/Trick");
}


if (ground) {
    global.deltaMultiplier = 1;
    PlayerSetAction(PlayerActionNormal);
    allowKeysTimer = 0;
}
