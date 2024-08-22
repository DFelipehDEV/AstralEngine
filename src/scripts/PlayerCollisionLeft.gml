/// PlayerCollisionLeft(x, y, angle, mask)
// This function returns if the left sensor has collided

// Store the actual mask for setting it up later
maskTemp = mask_index;
mask_index = argument3;

sensorSin = dsin(argument2);
sensorCos = dcos(argument2);

// Calculate sensor position
sensorX = floor(argument0 - sensorCos * sensorLeftDistance);
sensorY = floor(argument1 + sensorSin * sensorLeftDistance);

// Test collision
collisionTest = PlayerCollision(sensorX, sensorY, terrainLayer);

// Set to the old mask
mask_index = maskTemp;

return collisionTest;
