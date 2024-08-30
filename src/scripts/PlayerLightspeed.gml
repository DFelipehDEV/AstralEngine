/// PlayerLightspeed()

if (keySpecial3Pressed && distance_to_object(objRing) <= 40) {
    var _nearRing;
    _nearRing = instance_nearest(x, y, objRing);
    if (!collision_line(x, y, _nearRing.x, _nearRing.y, objTerrain, 1, 1)) {
        ySpeed = -1;
        ground = false;
        PlayerSetState(PlayerStateLightspeed);
        PlayerSetAngle(0);
    }
}
