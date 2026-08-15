/// PlayerCalculateAngle(x, y, angle)
var _x, _y, _angle;
_x = argument0;
_y = argument1;
_angle = argument2;

maskTemp = mask_index;
mask_index = maskDot;

// Limit the angle to 32 directions to maintain stability and reduce jittering
//_angle = round(_angle / angleFloorTo) * angleFloorTo;

var _angleCOS, _angleSIN;
if (_angle == angle) {
    _angleCOS = angleCos;
    _angleSIN = angleSin;
} else if (_angle == 0) {
    _angleCOS = 1;
    _angleSIN = 0;
} else {
    _angleCOS = dcos(_angle);
    _angleSIN = dsin(_angle);
}

var _baseLeftX, _baseLeftY, _baseRightX, _baseRightY;
_baseLeftX = floor(_x - _angleCOS * sensorAngleDistance);
_baseLeftY = floor(_y + _angleSIN * sensorAngleDistance);

_baseRightX = floor(_x + _angleCOS * sensorAngleDistance);
_baseRightY = floor(_y - _angleSIN * sensorAngleDistance);

var _bound, _leftDist, _rightDist, _pointLeftX, _pointLeftY, _pointRightX, _pointRightY;
_bound = max(16, ceil(abs(xSpeed) + abs(ySpeed)) + 16);

// Left point search
_leftDist = 0;
if (PlayerCheckTerrain(_baseLeftX, _baseLeftY)) {
    while (_leftDist > -_bound && PlayerCheckTerrain(_baseLeftX + _angleSIN * _leftDist, _baseLeftY + _angleCOS * _leftDist)) {
        _leftDist -= 1;
    }
    _leftDist += 1;
} else {
    while (_leftDist < _bound && !PlayerCheckTerrain(_baseLeftX + _angleSIN * _leftDist, _baseLeftY + _angleCOS * _leftDist)) {
        _leftDist += 1;
    }
}

// Right point search
_rightDist = 0;
if (PlayerCheckTerrain(_baseRightX, _baseRightY)) {
    while (_rightDist > -_bound && PlayerCheckTerrain(_baseRightX + _angleSIN * _rightDist, _baseRightY + _angleCOS * _rightDist)) {
        _rightDist -= 1;
    }
    _rightDist += 1;
} else {
    while (_rightDist < _bound && !PlayerCheckTerrain(_baseRightX + _angleSIN * _rightDist, _baseRightY + _angleCOS * _rightDist)) {
        _rightDist += 1;
    }
}

_pointLeftX = _baseLeftX + _angleSIN * _leftDist;
_pointLeftY = _baseLeftY + _angleCOS * _leftDist;

_pointRightX = _baseRightX + _angleSIN * _rightDist;
_pointRightY = _baseRightY + _angleCOS * _rightDist;

angleLeftX = _pointLeftX;
angleLeftY = _pointLeftY;
angleRightX = _pointRightX;
angleRightY = _pointRightY;

mask_index = maskTemp;

return point_direction(_pointLeftX, _pointLeftY, _pointRightX, _pointRightY);
