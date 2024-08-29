/// PlayerCollisionBottom(x, y, angle, mask)
// This function returns if the bottom sensor has collided

// Store the actual mask for setting it up later
maskTemp = mask_index;
mask_index = argument3;

sensorSin = dsin(argument2);
sensorCos = dcos(argument2);

// Calculate sensor position
sensorX = floor(argument0 + sensorSin * sensorBottomDistance);
sensorY = floor(argument1 + sensorCos * sensorBottomDistance);

// Test collision
collisionTest = PlayerCollision(sensorX, sensorY, terrainLayer);

// Test platform collision
if (!collisionTest && ySpeed >= 0 && !ground) {
    collisionTest = place_meeting(sensorX,
                                    sensorY,
                                    objPlatform) && !place_meeting(floor(argument0), floor(argument1), objPlatform);
}

// Set to the old mask
mask_index = maskTemp;

return collisionTest;
