/// EggpawnStateReturn()
if (stateEntering) {
    EnemySetAnimation(sprEnemyEggpawnWalk, 0.2);
    exit;
}
if (stateExiting) {
    exit;
}

if (x > normalStateX) {
    xSpeed = -1.6;
    image_xscale = -1;
}
else if (x < normalStateX) {
    xSpeed = 1.6;
    image_xscale = 1;
}

if (floorto(x, 4) == floorto(normalStateX, 4)) {
    StatesSet(EggpawnStateNormal);
}
