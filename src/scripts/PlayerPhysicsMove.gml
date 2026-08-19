/// PlayerPhysicsMove(scale)
if (!canMove) exit;
var _scale;
_scale = argument0;
if (canMoveX) x += (angleCos * xSpeed) * _scale;
if (canMoveY) y -= (angleSin * xSpeed) * _scale;

if (xSpeed > 0) {
    while (PlayerCollisionRight(x, y, angle, maskMid)) {
        x -= angleCos;
        y += angleSin;
    }
}

if (xSpeed < 0) {
    while (PlayerCollisionLeft(x, y, angle, maskMid)) {
        x += angleCos;
        y -= angleSin;
    }
}

PlayerCollisionCache();

if (ground) {
    // Eject up out of floor
    while (PlayerCollisionMain(x, y)) {
        x -= angleSin;
        y -= angleCos;
    }

    // Snap down flush to floor if bottom sensor is touching ground
    if (bottomCollision && !PlayerCollisionMain(x, y)) {
        while (!PlayerCollisionMain(x, y) && PlayerCollisionBottom(x, y, angle, maskBig)) {
            x += angleSin;
            y += angleCos;
        }
    }

    // Push down into slopes
    if (edgeCollision && PlayerCollisionSlope(x, y, angle, maskMid) && !PlayerCollisionMain(x, y)) {
        while (!PlayerCollisionMain(x, y)) {
            x += angleSin;
            y += angleCos;
        }
    }

    PlayerCollisionCache();

    // Fall if there isnt enough speed
    if (canFallFromSlope && angle >= fallAngleThreshold && angle <= 360-fallAngleThreshold && abs(xSpeed) < minSpeedToFall) {
        PlayerFlight();
    }

    // Fall off the ground if the edges aren't colliding
    if (angle != 0 && !edgeCollision) {
        PlayerFlight();               
    } 
    
    // Get new angle
    if (edgeCollision && ground) {
        // Store the new angle
        angleHolder = PlayerCalculateAngle(x, y, angle);

        // Smooth angle
        if (abs(angle - angleHolder) < 45) {
            PlayerSetAngle(angle + (angleHolder-angle)*0.5);
        } else {
            PlayerSetAngle(angleHolder);
        }
    } else {
        PlayerSetAngle(0);
    }

    // Leave the ground
    if (!bottomCollision) {
        PlayerSetGround(false);
        PlayerSetAngle(0);
    }                            
} else {                   
    if (canMoveY) y += ySpeed * _scale;
    
    // Ceiling
    if (ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskBig)) {
        if (PlayerCollisionLeftEdge(x, y, 180) && PlayerCollisionRightEdge(x, y, 180)) {
            PlayerSetAngle(PlayerCalculateAngle(x, y, 180));
                                    
            if (angle < 140 || angle > 220) {
                xSpeed = -angleSin * (ySpeed*1.5);
                ySpeed = 0;     
                PlayerSetGround(true);
                PlayerCollisionCache();             
            } else {
                PlayerSetAngle(0);
            }
        }
    }

    // Move the player outside in case he has got stuck into the floor or the ceiling           
    while (ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskMid)) {
        y += 1;
    }
    while (ySpeed > 0 && PlayerCollisionBottom(x, y, 0, maskMid)) {
        y -= 1;
    }            

    // Wall collision
    while (PlayerCollisionRight(x, y, angle, maskMid)) {
        x -= angleCos;
        y += angleSin;
    }
    
    while (PlayerCollisionLeft(x, y, angle, maskMid)) {
        x += angleCos;
        y -= angleSin;
    }

    PlayerCollisionCache();
    
    // Land
    if (ySpeed >= 0 && bottomCollision) {
        if (edgeCollision) {
            PlayerSetAngle(PlayerCalculateAngle(x, y, angle));
        }

        xSpeed -= angleSin * ySpeed; 
        ySpeed = 0;
        PlayerSetGround(true);
    }

    // Check if we're on the air but we collided with the ceiling
    if (ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskBig)) {
        ySpeed = 0;
    }
}
