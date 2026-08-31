/// PlayerStateStomp()
if (stateEntering) {
    AnimationPlay("STOMP");
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
ySpeed = stompSpeed;

// Land
if (ground) {
    StatesSet(PlayerStateStompLand);
    ySpeed = 0;

    PlaySound(sndPlayerStompLand);

    with (PlayerGetOwnedCamera()) CameraShakeY(20);
    StopSound(sndPlayerStomp);

    CreateDummy(x, y, sprPlayerStomp, 0.5, 0, depth - 1, bm_add, image_alpha, 1, 1, image_angle, merge_color(afterimageColor1, afterimageColor2, 0.5));
}

// Airdash
PlayerAirdash();
PlayerLightspeed();
