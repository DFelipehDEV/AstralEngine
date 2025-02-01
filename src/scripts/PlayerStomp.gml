/// PlayerStomp()
if (keyDownPressed && !ground) {
    DummyEffectCreate(x, y, sprBoostWave, 0.6, 0, -0.01, bm_normal, 1, 0.6, 0.6, 270);
    PlayerSetState(PlayerStateStomp);

    PlaySound(sndPlayerStomp);
    audio_stop(sndPlayerStompLand);
}
