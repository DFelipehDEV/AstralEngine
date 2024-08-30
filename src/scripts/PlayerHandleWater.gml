/// PlayerHandleWater()
// Handle water collision

var _waterHorizon, _waterTrigger;
_waterHorizon = PlayerCollisionObjectBottom(x, y, 0, maskMain, objWaterHorizon);
_waterTrigger = PlayerCollisionObjectBottom(x, y, 0, maskMain, objWater);

// Water mode
if (_waterHorizon != noone) {
    // Enter in water mode
    if (y > _waterHorizon.y && yprevious < _waterHorizon.y && PlayerCollisionObjectMain(x, y, objWater)) {
        PlayerPhysicModeSet(PhysicsWater);

        DummyEffectCreate(x, _waterHorizon.y, sprWaterDrop, 0.2, 0, -1, bm_add, 1, 1, 1, 0);
        PlaySoundSingle("snd/WaterSplash", global.volumeSounds, 1);
    }
}


if (physicsMode == PhysicsWater) {
    if (!PlayerCollisionObjectMain(x, y, objWater)) {
        PlayerPhysicModeSet(PhysicsNormal);
        underwaterDrownFrame = 0;
        underwaterAirTimer = 600;
        if (instance_exists(objWaterHorizon)) {
            DummyEffectCreate(x, instance_nearest(x, y, objWaterHorizon).y, sprWaterDrop, 0.2, 0, -1, bm_add, 1, 1, 1, 0);
            PlaySoundSingle("snd/WaterSplash", global.volumeSounds, 1);
        }
    }
}
else {
    // Water mode
    if (_waterTrigger != noone && !_waterHorizon) {
        PlayerPhysicModeSet(PhysicsWater);

        PlaySoundSingle("snd/WaterSplash", global.volumeSounds, 1);
    }
}
