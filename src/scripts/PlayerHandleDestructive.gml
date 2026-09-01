/// PlayerHandleDestructive()
if (!instance_exists(objDestructiveWall)) exit;

if (canAttack && ground) {
    var _wall;
    _wall = PlayerCollisionObjectRight(x + xSpeed, y, angle, maskBig, objDestructiveWall);
    if (_wall == noone) {
        _wall = PlayerCollisionObjectLeft(x + xSpeed, y, angle, maskBig, objDestructiveWall);
    }

    if (_wall != noone) {
        with (_wall) {
            PlaySound(snd);

            // Spawn debris parts
            var _randomRange, _absRange;
            repeat(7) {
                _randomRange = choose(-0.5, -0.3, 0.1, 0.3, 0.5);
                _absRange = abs(_randomRange);
                CreateDebris(x + random_range(-16, 16), y + random_range(-16, 16), -2, sprite_index, 0, 0, _randomRange, _randomRange, true, (_absRange*12) + other.xSpeed * 0.8, -((abs(other.xSpeed)*0.2) - (_absRange * 5)) - 5, 0.26 + _absRange*0.2);
                CreateDummy(x + random_range(-32, 32), y + random_range(-32, 32), sprExplosion2, 0.3, 0, -3, bm_normal, 1, 1, 1, 0);
            }
            instance_destroy();
        }
    }
}
