/// PlayerCollisionObjectMain(x, y, object)
// This functions returns if the main sensor has collided

//Store the actual mask for setting it up later
maskTemp = mask_index;
mask_index = maskMain;

sensorX = floor(argument0);
sensorY = floor(argument1)
//Test collision
collisionTest = instance_place(sensorX, sensorY, argument2);

//Set to the old mask
mask_index = maskTemp;

return collisionTest;
