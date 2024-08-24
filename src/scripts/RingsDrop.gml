/// RingsDrop(wasHurt, ringAmount)
// Steal and drop rings

// Play drop sound
if (argument0 == true) {
    PlaySound("snd/PlayerRingSteal");
}
var _ringValue, _ringAngle, _ringSpeed, _n, _t;
_ringValue = argument1;
_ringAngle = 101.25 * pi / 180;
_ringSpeed = 4;
_n = false;
_t = 0;

// Spawn rings
while (_ringValue) {
    var _ring;
    _ring = instance_create(x, y, objRingDrop);
    _ring.xSpeed = dcos(_ringAngle) * _ringSpeed;
    _ring.ySpeed = -dsin(_ringAngle) * _ringSpeed*1.15;
    _ring.dropTimer = 300;

    _ringAngle     += 23;
    _ringSpeed     -= 0.1;
    _ringValue     -= 1;
    if (_n) {
        _ring.xSpeed *= -1;
        _ringAngle += 22.5 * pi / 180;
    }
    _n = !_n;
    _t += 1;
    if (_t == 16) {
        _ringSpeed = 2;
        _ringAngle = 101.25 * pi / 180;
    }
}
