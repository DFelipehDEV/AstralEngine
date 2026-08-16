/// PlayerCheckRay(x1, y1, x2, y2, [object])
var _x1, _y1, _x2, _y2;
_x1 = argument0;
_y1 = argument1;
_x2 = argument2;
_y2 = argument3;

if (argument_count == 5) {
    return collision_line(_x1, _y1, _x2, _y2, argument[4], true, false);
}

if (collision_line(_x1, _y1, _x2, _y2, objSolid, true, false)) {
    return true;
}

if (ground) {
    if (collision_line(_x1, _y1, _x2, _y2, objPlatform, true, false)) {
        return true;
    }
}

if (terrainLayer == 0) {
    if (collision_line(_x1, _y1, _x2, _y2, objLayer0, true, false)) {
        return true;
    }
}

if (terrainLayer == 1) {
    if (collision_line(_x1, _y1, _x2, _y2, objLayer1, true, false)) {
        return true;
    }
}

return false;
