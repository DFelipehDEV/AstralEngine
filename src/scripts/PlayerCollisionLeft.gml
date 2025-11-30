/// PlayerCollisionLeft(x, y, angle, mask)
maskTemp = mask_index;
mask_index = argument3;

sensorSin = dsin(argument2);
sensorCos = dcos(argument2);
sensorX = floor(argument0 - sensorCos * sensorLeftDistance);
sensorY = floor(argument1 + sensorSin * sensorLeftDistance);

collisionTest = PlayerCheckTerrain(sensorX, sensorY);

mask_index = maskTemp;

return collisionTest;
