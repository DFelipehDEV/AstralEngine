/// PlayerHandleRails()

if (state != PlayerStateGrind) {
    var _railNormal, _railLayer0, _railLayer1;
    _railNormal = PlayerCollisionObjectBottom(x, y, 0, maskBig, objRail);
    _railLayer0 = PlayerCollisionObjectBottom(x, y, 0, maskBig, objRailLayer0);
    _railLayer1 = PlayerCollisionObjectBottom(x, y, 0, maskBig, objRailLayer1);

    // Rail
    if ((_railNormal != noone)
    || (_railLayer0 != noone && terrainLayer == 0)
    || (_railLayer1 != noone && terrainLayer == 1)) && ground {
        PlaySound(sndPlayerGrindLand);
        PlayerSetState(PlayerStateGrind);
    }
}
