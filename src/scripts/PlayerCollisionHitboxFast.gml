/// PlayerCollisionHitboxFast(x, y, object);
// This functions returns if the hitbox sensor has collided a specified object

// Store the actual mask for setting it up later
maskTemp = mask_index;
mask_index = maskHitbox;

// Test collision
collisionTest = place_meeting(argument0, argument1, argument2);

// Set to the old mask
mask_index = maskTemp;

return collisionTest;
