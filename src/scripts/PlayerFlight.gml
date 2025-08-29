/// PlayerFlight()

ySpeed = -angleSin*xSpeed;
xSpeed = angleCos*xSpeed;
boostAirTimer = 90;
PlayerSetGround(false);
PlayerSetAngle(0);
