/// PlayerCollision(x, y, terrainLayer)
// Check for terrain

if (place_meeting(argument0, argument1, parSolid)) {
    terrainPlatform = false;
    return true;
}

// Check for platform
if (place_meeting(argument0, argument1, parPlatform) && ground) {
    terrainPlatform = true;
    return true;
}

switch (argument2) {
    // Check for low layer
    case 0:
        if (place_meeting(argument0, argument1, parLayer0)) {
            terrainPlatform = false;
            return true;
        }
        break;

    // Check for high layer
    case 1:
        if (place_meeting(argument0, argument1, parLayer1)) {
            terrainPlatform = false;
            return true;
        }
        break;
}

return false;
