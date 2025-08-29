/// PlayerCollision(x, y)

var _x, _y;
_x = argument0;
_y = argument1;

if (place_meeting(_x, _y, objSolid)
|| (place_meeting(_x, _y, objLayer0) && terrainLayer == 0)
|| (place_meeting(_x, _y, objLayer1) && terrainLayer == 1)) {
    onPlatform = false;
    return true;
}

// Check for platform
if (place_meeting(_x, _y, objPlatform) && ground) {
    if (!onPlatform) {
        if (angleMode == 0) {
            onPlatform = true;
            return true;
        }
    } else {
        return true;
    }
}

return false;
