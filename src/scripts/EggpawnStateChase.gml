/// EggpawnStateChase()
if (stateEntering) {
    EnemySetAnimation(sprEnemyEggpawnRun, 0.3);
    exit;
}
if (stateExiting) {
    exit;
}

xSpeed = 4.5 * image_xscale;

if ((distance_to_object(target) > 140
     || distance_to_object(target) <= 140 && image_xscale != sign(target.x - x))
     || abs(x - normalStateX) > 350) {
    StatesSet(EggpawnStateReturn);
}
