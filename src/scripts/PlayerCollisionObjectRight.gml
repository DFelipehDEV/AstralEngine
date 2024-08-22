/// PlayerCollisionObjectRight(x, y, angle, mask, object)
// This function returns if the right sensor has collided a specified object

// Store the actual mask for setting it up later
maskTemp = mask_index;
mask_index = argument3;

// Calculate sensorSin and sensorCos
sensorSin = dsin(argument2);
sensorCos = dcos(argument2);

// Calculate sensor position
sensorX = floor(argument0 + sensorCos * sensorRightDistance);
sensorY = floor(argument1 - sensorSin * sensorRightDistance);

// Test collision with the specified object
collisionTest = instance_place(sensorX, sensorY, argument4);

// Set to the old mask
mask_index = maskTemp;

return collisionTest;
