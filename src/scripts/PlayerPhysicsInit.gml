/// PlayerPhysicsInit(solidObject, platformObject, layer0Object, layer1Object)
xSpeed = 0;
ySpeed = 0;
ground = false;
canMove = true;
canMoveX = true;
canMoveY = true;

minSpeedToFall = 4; // Minimum speed to fall when on a slope

// Angle
angle = 0;
angleHolder = 0;
angleCos = 0;
angleSin = 0;
angleMode = 0;
angleFloorTo = 360/32;
canFallFromSlope = true;
fallAngleThreshold = 75;
slopeFactor = 0.14;
slopeFactorMinAngle = 40;
angleLeftX = x;
angleLeftY = y;
angleRightX = x;
angleRightY = y;

// Sensors
sensorX = x;
sensorY = y;
sensorCos = dcos(angle);
sensorSin = dsin(angle);
bottomCollision = false;
edgeCollision = false;
sensorAngleDistance = 7;
sensorLeftDistance = 8;
sensorRightDistance = 8;
sensorBottomDistance = 12;
sensorTopDistance = 10;

// Other
terrainLayer = 0;
onPlatform = false;
solidObject = argument0;
platObject = argument1;
layer0Object = argument2;
layer1Object = argument3;
