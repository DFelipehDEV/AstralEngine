/// PlayerStateTricks()
if (stateEntering) {
    global.timeScale = 0.4;
    exit;
}
if (stateExiting) {
    global.timeScale = 1;
    exit;
}

afterimageTimer = 15;
if (animation == "SPRING") {
    image_angle = point_direction(xprevious, yprevious, x, y)-90;
}

if (lockKeysTimer == 0) {
    if (keyLeft || keyRight || keyUp || keyDown) {
        lockKeysTimer = 20;

        if (trickCombo < 9) {
            trickCombo += 1;
        }

        image_index = 0;
        AnimationApply(choose("HOMED", "HOMED_2", "SPRING_TRICK_HORIZONTAL", "SPRING_TRICK_VERTICAL"));

        PlayerAddEnergy(7);
        instance_create(x, y, objRainbow);
        PlaySound(sndTrick, 1, 1 + (trickCombo * 0.0441), 0);

        global.timeScale = 1;
    }
}

// Finish trick
if (keyLightspeedPressed) {
    trickCombo = 0;
    PlayerAddEnergy(21);

    StatesSet(PlayerStateSpring);
    AnimationApply("SPRING_TRICK_HORIZONTAL");

    PlaySound(sndTrick);
}


if (ground) {
    StatesSet(PlayerStateNormal);
    lockKeysTimer = 0;
}
