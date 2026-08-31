/// PlayerHandleWater()
if (!instance_exists(objWater) && !instance_exists(objWaterBubble)) exit;

var _waterBubble;
_waterBubble = PlayerCollisionHitbox(x, y, objWaterBubble);

var _water;
_water = PlayerCollisionObjectMain(x, y, objWater);

if (_water != noone) {
    // Enter water
    if (physicsMode != PhysicsWater) {
        PlayerSetPhysicsMode(PhysicsWater);
        CreateDummy(x, _water.y, sprWaterDrop, 0.2, 0, -1, bm_add, 1, 1, 1, 0);
        PlaySoundSingle(sndWaterSplash, 0.3);
    }
} else {
    // Exit water
    if (physicsMode == PhysicsWater) {
        PlayerSetPhysicsMode(PhysicsNormal);
        underwaterDrownFrame = 0;
        underwaterTime = 0;

        var _prevWater;
        _prevWater = PlayerCollisionObjectMain(xprevious, yprevious, objWater);
        if (_prevWater != noone) {
            CreateDummy(x, _prevWater.y, sprWaterDrop, 0.2, 0, -1, bm_add, 1, 1, 1, 0);
        }
        PlaySoundSingle(sndWaterSplash, 0.3);
    }
}

if (_waterBubble != noone) {
    underwaterTime = 0;
    underwaterDrownFrame = 0;
    AnimationApply("BREATHE");
    PlaySound(sndPlayerBubble);
    instance_destroy_id(_waterBubble);
}
