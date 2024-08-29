/// PlayerHandleLayers()
// Changes layers

// Layer 0
if (PlayerCollisionObjectMain(x, y, objSwitchLayer0)) {
    terrainLayer = 0;
}

// Layer switch
if (PlayerCollisionObjectMain(x, y, objSwitchLayerAlternate) && ground) {
    // Switch to layer 1
    if (xSpeed > 0) {
        terrainLayer = 1;
    }

    // Switch to layer 0
    if (xSpeed < 0) {
        terrainLayer = 0;
    }
}

// Layer 1
if (PlayerCollisionObjectMain(x, y, objSwitchLayer1)) {
    terrainLayer = 1;
}
