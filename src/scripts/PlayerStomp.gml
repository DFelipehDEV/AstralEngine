/// PlayerStomp()
if (keyStomp && !ground) {
    xSpeed = 0;
    ySpeed = 13;
    DummyEffectCreate(x, y, sprBoostWave, 0.6, 0, -0.01, bm_normal, 1, 0.6, 0.6, 270);
    PlayerSetState(PlayerStateStomp);

    PlaySound(sndPlayerStomp);
    audio_stop(sndPlayerStompLand);
}
