/// HeavyStateSpotted()
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

if (!instance_exists(target)) {
    target = instance_nearest(x, y, objPlayer);
}
if (instance_exists(target)) {
    image_xscale = esign(target.x - x, image_xscale);
} else {
    StatesSet(HeavyStateNormal);
    exit;
}

xSpeed = lerp(xSpeed, 0, 0.12 * global.timeScale);

if (stateTimer > 20) {
    StatesSet(HeavyStateChase);
}
