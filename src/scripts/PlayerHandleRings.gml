/// PlayerHandleRings()
var _ringNormal, _ringDrop, _ringSpecial;
_ringNormal = PlayerCollisionHitbox(x, y, objRing);
_ringDrop = PlayerCollisionHitbox(x, y, objRingDrop);

if (_ringNormal != noone) {
    global.playerRings += _ringNormal.value;
    PlayerAddEnergy(4);
    _ringNormal.collected = true;
    instance_destroy_id(_ringNormal);
}

if (_ringDrop != noone) {
    if (_ringDrop.liveTimer < _ringDrop.minTimeToBeCollectable) {
        global.playerRings += _ringDrop.value;
        _ringDrop.collected = true;
        instance_destroy_id(_ringDrop);
    }
}
