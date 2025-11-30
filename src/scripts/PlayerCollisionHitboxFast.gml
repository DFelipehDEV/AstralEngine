/// PlayerCollisionHitboxFast(x, y, object);
maskTemp = mask_index;
mask_index = maskHitbox;

collisionTest = place_meeting(argument0, argument1, argument2);

mask_index = maskTemp;

return collisionTest;
