/// PlayerCollisionSlope(x, y, angle, mask)
maskTemp = mask_index;
mask_index = argument3;

sensorCos = dcos(argument2);
sensorSin = dsin(argument2);
sensorX = floor(argument0 + sensorSin * 22);
sensorY = floor(argument1 + sensorCos * 22);

collisionTest = PlayerCheckTerrain(sensorX, sensorY);

mask_index = maskTemp;

return collisionTest;
