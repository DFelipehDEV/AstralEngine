/// PlayerFlight()

ySpeed = -angleSin*xSpeed;
xSpeed = angleCos*xSpeed;
boostAirTimer = boostAirTimerMax;
PlayerSetGround(false);
PlayerSetAngle(0);
