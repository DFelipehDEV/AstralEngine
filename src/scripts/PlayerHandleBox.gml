/// PlayerHandleBox()
if (canAttack) {
    if (state != PlayerStateJump) {
        var _box1;
        _box1 = PlayerCollisionObjectBottom(x, y + floor(ySpeed), 0, maskBig, objBox);

        if (_box1 != noone) {
            with (_box1) {
                PlaySound(sndBreakBox);
                instance_destroy();

                // Spawn metal parts
                repeat(4) {
                    var _wood;
                    _wood = instance_create(x, y, objBoxPart);
                    _wood.hspeed = random_range(-3, 3);
                    _wood.vspeed = random_range(-6, -3);
                    CreateDummy(x + random_range(-32, 32), y + random_range(-32, 32), sprExplosion2, 0.3, 0, -3, bm_normal, 1, 1, 1, 0)
                }
            }
        }
    }
}

if (state == PlayerStatePush) {
    var _pushableBox;
    _pushableBox = PlayerCollisionObjectMain(x + xDirection * 6, y, objPushableBox);

    if (_pushableBox != noone) {
        _pushableBox.xSpeed = xDirection * 0.8;
        xSpeed = xDirection * 0.8;
    }
}
