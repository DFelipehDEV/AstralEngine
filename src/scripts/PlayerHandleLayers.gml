/// PlayerHandleLayers()
if (!instance_exists(objSwitchLayer0) && !instance_exists(objSwitchLayer1) && !instance_exists(objSwitchLayerAlternate)) exit;

if (terrainLayer != 0 && PlayerCollisionObjectMain(x, y, objSwitchLayer0)) {
    terrainLayer = 0;
}

if (ground && PlayerCollisionObjectMain(x, y, objSwitchLayerAlternate)) {
    if (xSpeed > 0) {
        terrainLayer = 1;
    } else if (xSpeed < 0) {
        terrainLayer = 0;
    }
}

if (terrainLayer != 1 && PlayerCollisionObjectMain(x, y, objSwitchLayer1)) {
    terrainLayer = 1;
}
