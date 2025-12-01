/// PlayerCollisionRightEdge(x, y, angle)
sensorCos = dcos(argument2);
sensorSin = dsin(argument2);
sensorX = argument0 + sensorCos * 8 + sensorSin * 8;
sensorY = argument1 - sensorSin * 8 + sensorCos * 8;

return PlayerCheckLine(sensorX, sensorY, 32);
