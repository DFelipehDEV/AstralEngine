/// EggpawnStateSpotted()
if (stateEntering) {
    EnemySetAnimation(sprEnemyEggpawnIdle, 0.2);
    exit;
}
if (stateExiting) {
    exit;
}

if (alarm[1] == -1) {
    alarm[1] = 20;
    PlaySound(sndEnemyWarn);
    DummyEffectCreate(
        x - 10 * image_xscale, y - 25,
        sprEnemyWarn, 0.25, 0, 1,
        bm_normal, 1, 1, 1, 0
    );
}
