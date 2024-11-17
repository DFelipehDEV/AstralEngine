/// PlayerHandleDestructive()
// Handle collision with destructive objects

// Check if we are in a state that we can destroy the wall
if (attackPossible && ground) {
    if (PlayerCollisionObjectRight(x + xSpeed, y, angle, maskBig, objDestructiveWall) != noone || PlayerCollisionObjectLeft(x + xSpeed, y, angle, maskBig, objDestructiveWall) != noone) {
        with (instance_nearest(x + xSpeed, y, objDestructiveWall)) {
            PlaySoundExt(snd, global.soundVolume, 1, false);

            // Spawn debris parts
            var _randomRange, _absRange;
            repeat(7) {
                _randomRange = choose(-0.5, -0.3, 0.1, 0.3, 0.5);
                _absRange = abs(_randomRange);
                DebrisEffectCreate(x + random_range(-16, 16), y + random_range(-16, 16), -2, sprite_index, 0, 0, _randomRange, _randomRange, true, (_absRange*12) + other.xSpeed * 0.8, -((abs(other.xSpeed)*0.2) - (_absRange * 5)) - 5, 0.26 + _absRange*0.2);
                DummyEffectCreate(x + random_range(-32, 32), y + random_range(-32, 32), sprExplosion2, 0.3, 0, -3, bm_normal, 1, 1, 1, 0)
            }
            instance_destroy();
        }
    }
}
