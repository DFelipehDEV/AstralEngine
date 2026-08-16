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

var _bound, _leftDist, _rightDist;
_bound = min(20, max(14, ceil(abs(xSpeed) + abs(ySpeed)) + 8));

// Left point search
_leftDist = 0;
if (PlayerCheckTerrain(_baseLeftX, _baseLeftY)) {
    while (_leftDist > -_bound && PlayerCheckTerrain(_baseLeftX + _angleSIN * _leftDist, _baseLeftY + _angleCOS * _leftDist)) {
        _leftDist -= 1;
    }
    _leftDist += 1;
} else {
    while (_leftDist < _bound && !PlayerCheckTerrain(_baseLeftX + _angleSIN * _leftDist, _baseLeftY + _angleCOS * _leftDist)) {
        _leftDist += 2;
    }
    if (_leftDist > 0 && _leftDist < _bound && PlayerCheckTerrain(_baseLeftX + _angleSIN * (_leftDist - 1), _baseLeftY + _angleCOS * (_leftDist - 1))) {
        _leftDist -= 1;
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
        _rightDist += 2;
    }
    if (_rightDist > 0 && _rightDist < _bound && PlayerCheckTerrain(_baseRightX + _angleSIN * (_rightDist - 1), _baseRightY + _angleCOS * (_rightDist - 1))) {
        _rightDist -= 1;
    }
}

angleLeftX = _baseLeftX + _angleSIN * _leftDist;
angleLeftY = _baseLeftY + _angleCOS * _leftDist;

angleRightX = _baseRightX + _angleSIN * _rightDist;
angleRightY = _baseRightY + _angleCOS * _rightDist;

mask_index = maskTemp;

return point_direction(angleLeftX, angleLeftY, angleRightX, angleRightY);
