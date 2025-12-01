/// PlayerCheckLine(x, y, length, [object])
var _x, _y, _length;
_x = argument0;
_y = argument1;
_length = argument2;

var _x2, _y2;
_x2 = _x + sensorSin * _length;
_y2 = _y + sensorCos * _length;
if (argument_count == 4) {
    return collision_line(_x, _y, _x2, _y2, argument3, true, false);
} else {
    if (collision_line(_x, _y, _x2, _y2, objSolid, true, false)) {
        return true;
    }

    if (ground) {
        if (collision_line(_x, _y, _x2, _y2, objPlatform, true, false)) {
            return true;
        }
    }

    if (terrainLayer == 0) {
        if (collision_line(_x, _y, _x2, _y2, objLayer0, true, false)) {
            return true;
        }
    }

    if (terrainLayer == 1) {
        if (collision_line(_x, _y, _x2, _y2, objLayer1, true, false)) {
            return true;
        }
    }

    return false;
}
