/// PlayerCollisionRightEdge(x, y, angle)
// This function returns if the right edge sensor has collided

sensorCos = dcos(argument2);
sensorSin = dsin(argument2);

sensorX = argument0 + sensorCos * 8 + sensorSin * 8;
sensorY = argument1 - sensorSin * 8 + sensorCos * 8;

if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, objSolid, 1, 0)) {
    terrainPlatform = false;
    return true;
}

// Check for platform
if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, objPlatform, 1, 0) && ground) {
    terrainPlatform = true;
    return true;
}

switch (terrainLayer) {
    // Check for low layer
    case 0:
        if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, objLayer0, 1, 0)) {
            terrainPlatform = false;
            return true;
        }
        break;

    // Check for high layer
    case 1:
        if (collision_line(sensorX, sensorY, argument0 + sensorCos * 8 + sensorSin * 36, argument1 - sensorSin * 8 + sensorCos * 36, objLayer1, 1, 0)) {
            terrainPlatform = false;
            return true;
        }
        break;
}

terrainPlatform = false;
return false;
