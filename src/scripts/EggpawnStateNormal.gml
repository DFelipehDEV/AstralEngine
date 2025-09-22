/// EggpawnStateNormal()
if (stateEntering) {
    EnemySetAnimation(sprEnemyEggpawnWalk, 0.2);
    exit;
}
if (stateExiting) {
    exit;
}

normalStateX = x;

if (canMove) {
    xSpeed = 1.6 * image_xscale;

    var _nearPlayer;
    _nearPlayer = instance_nearest(x, y, objPlayer);

    if (distance_to_object(_nearPlayer) < 135) {
        if (image_xscale == sign(_nearPlayer.x - x)) {
            xSpeed = 0;
            target = _nearPlayer;
            StatesSet(EggpawnStateSpotted);
        }
    }

    if (place_meeting(x, y, objEnemyTurn) && !place_meeting(xprevious, yprevious, objEnemyTurn)) {
        xSpeed = 0;
        StatesSet(EggpawnStateTurn);
    }
}
