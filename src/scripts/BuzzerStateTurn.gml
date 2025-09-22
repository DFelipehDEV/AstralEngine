/// BuzzerStateTurn()
if (stateEntering) {
    EnemySetAnimation(sprEnemyBuzzerMove, 0.2);
    exit;
}
if (stateExiting) {
    exit;
}

if (stateTimer < 30) {
    xSpeed = 0;
} else {
    EnemySetAnimation(sprEnemyBuzzerTurn, 0.25);
    if (stateTimer > 38) {
        image_xscale = -image_xscale;
        StatesSet(BuzzerStateNormal);
    }
}
