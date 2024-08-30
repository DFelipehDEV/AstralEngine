/// PlayerHandleBox()
// Handle collision with boxes

if (attackPossible) {
    if (state != PlayerStateJump) {
        var _box1;
        _box1 = PlayerCollisionObjectBottom(x, y + floor(ySpeed), 0, maskBig, objBox1);

        if (_box1 != noone) {
            with (_box1) {
                PlaySound("snd/BoxDestroy");
                instance_destroy();

                // Spawn metal parts
                repeat(4) {
                    var _wood;
                    _wood = instance_create(x, y, objBoxPart);
                    _wood.hspeed = random_range(-3, 3);
                    _wood.vspeed = random_range(-6, -3);
                    DummyEffectCreate(x + random_range(-32, 32), y + random_range(-32, 32), sprExplosion2, 0.3, 0, -3, bm_normal, 1, 1, 1, 0)
                }
            }
        }
    }
}
