/// HeavyStateSpotted()
if (stateEntering) {
    PlaySound(sndEnemyWarn);
    DummyEffectCreate(
        x - 10 * image_xscale, y - 25,
        sprEnemyWarn, 0.25, 0, 1,
        bm_normal, 1, 1, 1, 0
    );
    xSpeed = 0;
    exit;
}
if (stateExiting) {
    exit;
}

image_xscale = esign(objPlayer.x - x, image_xscale);
xSpeed = lerp(xSpeed, 0, 0.12);

if (stateTimer > 20) {
    StatesSet(HeavyStateChase);
}
