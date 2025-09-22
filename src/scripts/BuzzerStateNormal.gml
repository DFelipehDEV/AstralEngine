/// BuzzerStateNormal()
if (stateEntering) {
    EnemySetAnimation(sprEnemyBuzzerMove, 0.32);
    target = noone;
    exit;
}
if (stateExiting) {
    exit;
}

xSpeed = 2 * image_xscale;

if (stateTimer > 30) {
    var _nearest;
    _nearest = instance_nearest(x, y, objPlayer);

    if (_nearest != noone && distance_to_object(_nearest) < 260 && sign(_nearest.x - x) == image_xscale) {
        target = _nearest;

        StatesSet(BuzzerStateSpotted);
    } else {
        target = noone;
    }
}


if (place_meeting(x, y, objEnemyTurn) && !place_meeting(xprevious, yprevious, objEnemyTurn)) {
    xSpeed = 0;
    StatesSet(BuzzerStateTurn);
}
