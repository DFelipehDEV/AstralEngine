/// PlayerHandleRings()
var _ringNormal, _ringDrop, _ringMagnetic;
_ringNormal = PlayerCollisionHitbox(x, y, objRing);
_ringDrop = PlayerCollisionHitbox(x, y, objRingDrop);
_ringMagnetic = PlayerCollisionHitbox(x, y, objRingMagnetic);

if (_ringNormal != noone) {
    rings += _ringNormal.value;
    PlayerAddEnergy(4);
    _ringNormal.collected = true;
    instance_destroy_id(_ringNormal);
}

if (_ringDrop != noone) {
    if (_ringDrop.liveTimer < _ringDrop.minTimeToBeCollectable) {
        rings += _ringDrop.value;
        _ringDrop.collected = true;
        instance_destroy_id(_ringDrop);
    }
}

if (_ringMagnetic != noone) {
    rings += 1;
    PlayerAddEnergy(4);
    instance_create(x, y, objRingCollected);
    PlaySoundSingle(sndRing);
    instance_destroy_id(_ringMagnetic);
}
