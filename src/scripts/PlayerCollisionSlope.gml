/// PlayerCollisionSlope(x, y, angle, mask)
// This functions returns if the slope sensor has collided

// Store the actual mask for setting it up later
maskTemp = mask_index;
mask_index = argument3;

sensorCos = dcos(argument2);
sensorSin = dsin(argument2);

sensorX = floor(argument0 + sensorSin * 22);
sensorY = floor(argument1 + sensorCos * 22);

// Test collision
collisionTest = PlayerCollision(sensorX, sensorY);

// Set to the old mask
mask_index = maskTemp;

// Return result
return collisionTest;
