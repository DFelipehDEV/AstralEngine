/// EggpawnStateSpotted()
if (stateEntering) {
    PlaySound(sndEnemyWarn);
    CreateDummy(
        x - 10 * image_xscale, y - 25,
        sprEnemyWarn, 0.2, 0, 1,
        bm_normal, 1, 1, 1, 0
    );
    xSpeed = 0;
    exit;
}
if (stateExiting) {
    exit;
}

if (stateTimer > 20) {
    StatesSet(EggpawnStateChase);
}
