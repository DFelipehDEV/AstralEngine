/// PlayerCheckTerrain(x, y)
var _x, _y;
_x = argument0;
_y = argument1;

if (place_meeting(_x, _y, objSolid)) {
    onPlatform = false;
    return true;
}

if (terrainLayer == 0) {
    if (place_meeting(_x, _y, objLayer0)) {
        onPlatform = false;
        return true;
    }
}

if (terrainLayer == 1) {
    if (place_meeting(_x, _y, objLayer1)) {
        onPlatform = false;
        return true;
    }
}

if (ground) {
    if (place_meeting(_x, _y, objPlatform)) {
        if (!onPlatform) {
            if (angleMode == 0) {
                onPlatform = true;
                return true;
            }
        } else {
            return true;
        }
    }
}

return false;
