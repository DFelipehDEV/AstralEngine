/// PlayerCollisionHitbox(x, y, object);
maskTemp = mask_index;
mask_index = maskHitbox;

sensorX = floor(argument0);
sensorY = floor(argument1);

collisionTest = instance_place(sensorX, sensorY, argument2);

mask_index = maskTemp;

return collisionTest;
