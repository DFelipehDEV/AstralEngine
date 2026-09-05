/// PlayerStateTricks()
if (stateEntering) {
    global.timeScale = 0.4;
    exit;
}
if (stateExiting) {
    global.timeScale = 1;
    exit;
}

afterImageTimer = 15;
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
        AnimationPlay(choose("HOMED", "HOMED_2", "TRICK_HOR", "TRICK_VER"));

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
    AnimationPlay("TRICK_HOR");

    PlaySound(sndTrick);
}


if (ground) {
    StatesSet(PlayerStateNormal);
    lockKeysTimer = 0;
}
