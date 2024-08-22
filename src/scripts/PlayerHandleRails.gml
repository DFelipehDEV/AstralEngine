/// PlayerHandleRails()
// Handle rails collision

if (action != PlayerActionGrind) {
    var _railNormal, _railLayer0, _railLayer1;
    _railNormal = PlayerCollisionObjectBottom(x, y, 0, maskBig, parRail);
    _railLayer0 = PlayerCollisionObjectBottom(x, y, 0, maskBig, parRailLayer0);
    _railLayer1 = PlayerCollisionObjectBottom(x, y, 0, maskBig, parRailLayer1);

    // Rail
    if ((_railNormal != noone)
    || (_railLayer0 != noone && terrainLayer == 0)
    || (_railLayer1 != noone && terrainLayer == 1)) && ground {
        PlaySound("sndPlayerGrindStart");
        PlayerSetAction(PlayerActionGrind);
    }
}
