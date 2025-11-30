/// PlayerCollisionMain(x, y)
maskTemp = mask_index;
mask_index = maskMain;

sensorX = floor(argument0);
sensorY = floor(argument1);

collisionTest = PlayerCheckTerrain(sensorX, sensorY);

mask_index = maskTemp;

return collisionTest;
