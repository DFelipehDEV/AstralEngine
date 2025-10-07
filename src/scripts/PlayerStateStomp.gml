/// PlayerStateStomp()
if (stateEntering) {
    AnimationApply("STOMP");
    trailTimer = 80;
    sensorBottomDistance = 14;
    image_angle = 0;
    exit;
}

if (stateExiting) {
    PlayerResetSensors();
    exit;
}

PlayerMoveX();
xSpeed = approach(xSpeed, 0, 0.01)
ySpeed = 15;

// Land
if (ground) {
    StatesSet(PlayerStateStompLand);
    ySpeed = 0;

    PlaySound(sndPlayerStompLand);
    with (cam)
        CameraShakeY(20);
    audio_stop(sndPlayerStomp);

    CreateDummy(x, y, sprPlayerStomp, 0.45, 0, -0.1, bm_normal, image_alpha, 1, 1, image_angle)
}

// Airdash
PlayerAirdash();
