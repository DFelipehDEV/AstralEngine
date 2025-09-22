/// PlayerCalculateAngle(x, y, angle)
 // Detects the angle using two points that approach the ground.

var _x, _y, _angle;
_x = argument0;
_y = argument1;
_angle = argument2;
// Limit the angle to 32 directions to maintain stability and reduce jittering
_angle = round(_angle / 11.25) * 11.25;

// Store temporary values
maskTemp = mask_index
mask_index = maskDot;

var _angleCOS, _angleSIN;
_angleCOS = dcos(_angle);
_angleSIN = dsin(_angle);

// Set the starting position of the sensors based on the angle
var _pointLeftX, _pointLeftY, _pointRightX, _pointRightY;
_pointLeftX = floor(_x - _angleCOS * 8);
_pointLeftY = floor(_y + _angleSIN * 8);

_pointRightX = floor(_x + _angleCOS * 8);
_pointRightY = floor(_y - _angleSIN * 8);

var _collisionLeft, _collisionRight;
_collisionLeft = false;
_collisionRight = false;
// Check if it is colliding with the ground
// Now, perform the checking. Push down the two points in order to touch the floor
repeat (20) {
    if (!_collisionLeft && PlayerCollision(_pointLeftX, _pointLeftY, terrainLayer)) {
        _collisionLeft = true;
    }
    else if (!_collisionLeft) {
        _pointLeftX += _angleSIN;
        _pointLeftY += _angleCOS;
    }

    if (!_collisionRight && PlayerCollision(_pointRightX, _pointRightY, terrainLayer)) {
        _collisionRight = true;
    }
    else if (!_collisionRight) {
        _pointRightX += _angleSIN;
        _pointRightY += _angleCOS;
    }

    // If both points are colliding, break the loop
    if (_collisionLeft && _collisionRight) {
        break;
    }
}

// Restore the previous mask
mask_index = maskTemp;

// Calculate and return the direction
return point_direction(_pointLeftX, _pointLeftY, _pointRightX, _pointRightY);
