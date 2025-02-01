/// PlayerHomingAttack()

canHome = true;
if (instance_exists(homingReticle)) {
    if (keyActionPressed) {
        DummyEffectCreate(x, y, sprBoostWave, 0.4, 0, -0.01, bm_normal, 1, 0.5, 0.6, point_direction(x, y, homingReticle.x, homingReticle.y));
        PlayVoice(choose(sndNoone, voiceline[0]));
        PlayerSetState(PlayerStateHomingAttack);
        trailTimer = 80;
        PlaySound(sndPlayerHome);
    }
}
