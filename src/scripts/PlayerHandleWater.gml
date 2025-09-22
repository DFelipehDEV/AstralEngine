/// PlayerHandleWater()
// Handle water collision

var _waterHorizon, _waterTrigger, _waterBubble;
_waterHorizon = PlayerCollisionObjectBottom(x, y, 0, maskMain, objWaterHorizon);
_waterTrigger = PlayerCollisionObjectBottom(x, y, 0, maskMain, objWater);
_waterBubble = PlayerCollisionHitbox(x, y, objWaterBubble);

// Water mode
if (_waterHorizon != noone) {
    // Enter in water mode
    if (y > _waterHorizon.y && yprevious < _waterHorizon.y && PlayerCollisionObjectMain(x, y, objWater)) {
        PlayerSetPhysicsMode(PhysicsWater);

        DummyEffectCreate(x, _waterHorizon.y, sprWaterDrop, 0.2, 0, -1, bm_add, 1, 1, 1, 0);
        PlaySoundSingle(sndWaterSplash, global.soundVolume, 1);
    }
}

if (physicsMode == PhysicsWater) {
    if (!PlayerCollisionObjectMain(x, y, objWater)) {
        PlayerSetPhysicsMode(PhysicsNormal);
        underwaterDrownFrame = 0;
        underwaterTime = 0;

        if (instance_exists(objWaterHorizon)) {
            DummyEffectCreate(x, instance_nearest(x, y, objWaterHorizon).y, sprWaterDrop, 0.2, 0, -1, bm_add, 1, 1, 1, 0);
            PlaySoundSingle(sndWaterSplash, global.soundVolume, 1);
        }
    }
}
else {
    // Water mode
    if (_waterTrigger != noone && !_waterHorizon) {
        PlayerSetPhysicsMode(PhysicsWater);

        PlaySoundSingle(sndWaterSplash, global.soundVolume, 1);
    }
}

if (_waterBubble != noone) {
    underwaterTime = 0;
    underwaterDrownFrame = 0;
    AnimationApply("BREATHE");
    PlaySound(sndPlayerBubble);
    instance_destroy_id(_waterBubble);
}
