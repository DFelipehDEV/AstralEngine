/// EggpawnStateChase()
if (stateEntering) {
    EnemySetAnimation(sprEnemyEggpawnRun, 0.3);
    exit;
}
if (stateExiting) {
    exit;
}

if (!instance_exists(target)) {
    target = noone;
    StatesSet(EggpawnStateReturn);
    exit;
}

xSpeed = lerp(xSpeed, 4.5 * image_xscale, 0.1 * global.timeScale);
image_xscale = esign(target.x - x, image_xscale);

if (distance_to_object(target) > 160 || abs(x - normalStateX) > 350) {
    StatesSet(EggpawnStateReturn);
}
