/// PlayerCollisionHitbox(x, y, object);
maskTemp = mask_index;
mask_index = maskHitbox;
collisionTest = instance_place(argument0, argument1, argument2);
mask_index = maskTemp;
return collisionTest;
