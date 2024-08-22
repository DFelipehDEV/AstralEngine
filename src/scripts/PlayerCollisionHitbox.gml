/// PlayerCollisionHitbox(x, y, object);
// This functions returns if the hitbox sensor has collided a specified object

// Store the actual mask for setting it up later
maskTemp = mask_index;
mask_index = maskHitbox;

sensorX = floor(argument0);
sensorY = floor(argument1);

// Test collision
collisionTest = instance_place(sensorX, sensorY, argument2);

// Set to the old mask
mask_index = maskTemp;

return collisionTest;
