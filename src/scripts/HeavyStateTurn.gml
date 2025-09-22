/// HeavyStateTurn()
if (stateEntering) {
    EnemySetAnimation(sprEnemyHeavyWalk, 0.2);
    exit;
}
if (stateExiting) {
    exit;
}

if (stateTimer < 30) {
    xSpeed = 0;
} else {
    EnemySetAnimation(sprEnemyHeavyTurn, 0.25);
    if (stateTimer > 38) {
        image_xscale = -image_xscale;
        StatesSet(HeavyStateNormal);
    }
}
