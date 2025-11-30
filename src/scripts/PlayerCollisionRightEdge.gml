/// PlayerCollisionRightEdge(x, y, angle)
sensorCos = dcos(argument2);
sensorSin = dsin(argument2);
sensorX = argument0 + sensorCos * 8 + sensorSin * 8;
sensorY = argument1 - sensorSin * 8 + sensorCos * 8;

if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, objSolid, 1, 0)) {
    return true;
}

if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, objPlatform, 1, 0) && ground) {
    return true;
}

switch (terrainLayer) {
    case 0:
        if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, objLayer0, 1, 0)) {
            return true;
        }
        break;

    case 1:
        if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, objLayer1, 1, 0)) {
            return true;
        }
        break;
}

return false;
