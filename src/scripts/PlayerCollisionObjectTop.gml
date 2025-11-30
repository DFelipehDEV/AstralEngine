/// PlayerCollisionObjectTop(x, y, angle, mask, object)
maskTemp = mask_index;
mask_index = argument3;

sensorSin = dsin(argument2);
sensorCos = dcos(argument2);
sensorX = floor(argument0 - sensorSin * sensorTopDistance);
sensorY = floor(argument1 + sensorCos * sensorTopDistance);

collisionTest = instance_place(sensorX, sensorY, argument4);

mask_index = maskTemp;

return collisionTest;
