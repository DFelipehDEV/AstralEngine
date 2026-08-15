/// PlayerCollisionBottom(x, y, angle, mask)
maskTemp = mask_index;
mask_index = argument3;

if (argument2 == angle) { sensorCos = angleCos; sensorSin = angleSin; } else if (argument2 == 0) { sensorCos = 1; sensorSin = 0; } else { sensorCos = dcos(argument2); sensorSin = dsin(argument2); }
sensorX = floor(argument0 + sensorSin * sensorBottomDistance);
sensorY = floor(argument1 + sensorCos * sensorBottomDistance);

collisionTest = PlayerCheckTerrain(sensorX, sensorY);

// Test platform collision
if (!collisionTest && ySpeed >= 0 && !ground) {
    collisionTest = place_meeting(sensorX,
                                    sensorY,
                                    objPlatform) && !place_meeting(floor(argument0), floor(argument1), objPlatform);
}

mask_index = maskTemp;

return collisionTest;
