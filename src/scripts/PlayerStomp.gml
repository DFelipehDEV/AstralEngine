/// PlayerStomp()
if (keyDownPressed && !ground) {
    DummyEffectCreate(x, y, sprVFXBoostWave, 0.6, 0, -0.01, bm_normal, 1, 0.6, 0.6, 270);
    PlayerSetAction(PlayerActionStomp);

    PlaySound("sndPlayerStompStart");
    StopSound("sndPlayerStompLand");
}
