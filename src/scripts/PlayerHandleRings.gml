/// PlayerHandleRings()
var _ring;
_ring = PlayerCollisionHitbox(x, y, objRing);

if (_ring != noone) {
    rings += _ring.value;
    PlayerAddEnergy(4);
    with (_ring) {
        event_user(0);
        instance_destroy();
    }
}

var _ringDrop;
_ringDrop = PlayerCollisionHitbox(x, y, objRingDrop);

if (_ringDrop != noone) {
    if (_ringDrop.liveTimer < _ringDrop.minTimeToBeCollectable) {
        rings += _ringDrop.value;
        with (_ringDrop) {
            event_user(0);
            instance_destroy();
        }
    }
}
