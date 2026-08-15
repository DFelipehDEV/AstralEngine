/// PlayerCollisionRightEdge(x, y, angle)
if (argument2 == angle) { sensorCos = angleCos; sensorSin = angleSin; } else if (argument2 == 0) { sensorCos = 1; sensorSin = 0; } else { sensorCos = dcos(argument2); sensorSin = dsin(argument2); }
sensorX = argument0 + sensorCos * 8 + sensorSin * 8;
sensorY = argument1 - sensorSin * 8 + sensorCos * 8;

return PlayerCheckLine(sensorX, sensorY, 32);
