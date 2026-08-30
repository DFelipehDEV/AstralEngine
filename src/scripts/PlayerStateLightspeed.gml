/// PlayerStateLightspeed()
if (stateEntering) {
    AnimationApply("SPRING");
    exit;
}
if (stateExiting) {
    exit;
}

afterimageTimer = 15;
if (distance_to_object(objRing) > 90 || !instance_exists(objRing) || ground) {
    StatesSet(PlayerStateAir);
    AnimationApply("LANDING");
    xSpeed /= 1.65;
    ySpeed /= 1.2;
} else {
    var _nearRing, _ringDir;
    _nearRing = instance_nearest(x, y, objRing);
    if (instance_exists(_nearRing)) {
        _ringDir = point_direction(x, y, _nearRing.x, _nearRing.y);
        xSpeed = lerp(xSpeed, lengthdir_x(12, _ringDir), 0.4 * global.timeScale);
        ySpeed = lerp(ySpeed, lengthdir_y(12, _ringDir), 0.4 * global.timeScale);
        image_angle = _ringDir - 90;
    }
}
