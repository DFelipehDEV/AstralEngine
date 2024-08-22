/// PlayerCollisionMain(x, y)
// This functions returns if the main sensor has collided

//Store the actual mask for setting it up later
maskTemp = mask_index;
mask_index = maskMain;

sensorX = floor(argument0);
sensorY = floor(argument1);

//Test collision
collisionTest = PlayerCollision(sensorX, sensorY, terrainLayer);

//Set to the old mask
mask_index = maskTemp;

return collisionTest;
