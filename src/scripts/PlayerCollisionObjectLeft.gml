/// PlayerCollisionObjectLeft(x, y, angle, mask, object);
maskTemp = mask_index;
mask_index = argument3;

if (argument2 == angle) { sensorCos = angleCos; sensorSin = angleSin; } else if (argument2 == 0) { sensorCos = 1; sensorSin = 0; } else { sensorCos = dcos(argument2); sensorSin = dsin(argument2); }
sensorX = floor(argument0 - sensorCos * sensorLeftDistance);
sensorY = floor(argument1 + sensorSin * sensorLeftDistance);

collisionTest = instance_place(sensorX, sensorY, argument4);

mask_index = maskTemp;

return collisionTest;
