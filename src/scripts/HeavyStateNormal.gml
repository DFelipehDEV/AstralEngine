/// HeavyStateNormal()
if (stateEntering) {
    EnemySetAnimation(sprEnemyHeavyWalk, 0.15);
    normalStateX = x;
    exit;
}
if (stateExiting) {
    exit;
}

if (canMove) {
    xSpeed = 1.6 * image_xscale;

    var _nearPlayer;
    _nearPlayer = instance_nearest(x, y, objPlayer);

    if (distance_to_object(_nearPlayer) < 135 || hit) {
        if (image_xscale == sign(_nearPlayer.x - x)) {
            xSpeed = 0;
            target = _nearPlayer;
            StatesSet(HeavyStateSpotted);
        }
    }

    if (place_meeting(x, y, objEnemyTurn) && !place_meeting(xprevious, yprevious, objEnemyTurn)) {
        xSpeed = 0;
        StatesSet(HeavyStateTurn);
    }
}
