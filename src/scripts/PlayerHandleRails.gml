/// PlayerHandleRails()
if (!ground || state == PlayerStateGrind) exit;
if (!instance_exists(objRail) && !instance_exists(objRailLayer0) && !instance_exists(objRailLayer1)) exit;

var _railNormal;
_railNormal = PlayerCollisionObjectBottom(x, y, 0, maskBig, objRail);
if (_railNormal != noone) {
    PlaySound(sndPlayerGrindLand);
    StatesSet(PlayerStateGrind);
    exit;
}

if (terrainLayer == 0) {
    if (PlayerCollisionObjectBottom(x, y, 0, maskBig, objRailLayer0) != noone) {
        PlaySound(sndPlayerGrindLand);
        StatesSet(PlayerStateGrind);
    }
} else if (terrainLayer == 1) {
    if (PlayerCollisionObjectBottom(x, y, 0, maskBig, objRailLayer1) != noone) {
        PlaySound(sndPlayerGrindLand);
        StatesSet(PlayerStateGrind);
    }
}
