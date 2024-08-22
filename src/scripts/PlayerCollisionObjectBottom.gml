/// PlayerCollisionObjectBottom(x, y, angle, mask, object)
// This function returns if the bottom sensor has collided a specified object

// Store the actual mask for setting it up later
maskTemp = mask_index;
mask_index = argument3;

sensorSin = dsin(argument2);
sensorCos = dcos(argument2);

// Calculate sensor position
sensorX = floor(argument0 + sensorSin * sensorBottomDistance);
sensorY = floor(argument1 + sensorCos * sensorBottomDistance);

// Test collision
collisionTest = instance_place(sensorX, sensorY, argument4);

// Set to the old mask
mask_index = maskTemp;

// Return result
return collisionTest;
