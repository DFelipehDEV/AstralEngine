/// PlayerStateTricks()

afterimageTimer = 15;
if (animation == "SPRING") {
    image_angle = point_direction(xprevious, yprevious, x, y)-90;
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

        image_index = 0;
        AnimationApply(choose("HOMED", "HOMED_2", "SPRING_TRICK_HORIZONTAL", "SPRING_TRICK_VERTICAL"));

        // Get energy
        PlayerAddEnergy(7);

        // Create rainbow effect
        instance_create(x, y, objRainbow);

        PlaySoundExt("snd/Trick", global.soundVolume, 1 + (trickCombo * 0.0441), 0);

        if (global.timeScale == 0.4) {
            global.timeScale = 1;
        }
    }
}

// Finish trick
if (keySpecial3Pressed) {
    trickCombo = 0;
    PlayerAddEnergy(21);

    PlayerSetState(PlayerStateSpring);
    AnimationApply("SPRING_TRICK_HORIZONTAL");

    global.timeScale = 1;
    PlaySound("snd/Trick");
}


if (ground) {
    global.timeScale = 1;
    PlayerSetState(PlayerStateNormal);
    allowKeysTimer = 0;
}
