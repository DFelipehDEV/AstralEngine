/// PlayerHomingAttack()
if (!hasHomingAttack || !canHomingAttack) exit;
canHome = true;
if (instance_exists(homingReticle)) {
    if (keyActionPressed) {
        CreateDummy(x, y, sprBoostWave, 0.4, 0, -0.01, bm_normal, 1, 0.5, 0.6, point_direction(x, y, homingReticle.x, homingReticle.y));
        PlayVoice(choose(voiceline[0], -1));
        StatesSet(PlayerStateHomingAttack);
        trailTimer = 80;
        PlaySound(sndPlayerHome);
    }
}
