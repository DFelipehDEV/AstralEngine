/// PlayerCollision(x, y)

var _x, _y;
_x = argument0;
_y = argument1;

terrainPlatform = false;

if (place_meeting(_x, _y, objSolid)
|| (place_meeting(_x, _y, objLayer0) && terrainLayer == 0)
|| (place_meeting(_x, _y, objLayer1) && terrainLayer == 1)) {
    return true;
}

// Check for platform
if (place_meeting(_x, _y, objPlatform) && ground) {
    terrainPlatform = true;
    return true;
}

return false;
