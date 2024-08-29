/// PlayerActionStomp()

PlayerXMovement();
xSpeed = approach(xSpeed, 0, 0.01)
ySpeed = 16;

// Land
if (ground) {
    PlayerSetAction(PlayerActionStompLand);
    ySpeed = 0;

    PlaySound("snd/PlayerStompLand");
    with (cam)
        CameraShakeY(20);
    sound_stop("snd/PlayerStompStart");

    DummyEffectCreate(x, y, sprPlayerStomp, 0.45, 0, -0.1, bm_normal, image_alpha, 1, 1, animationAngle)
}

// Airdash
PlayerAirdash();
