/// PlayerApplySlopeFactor([timeScale=1])
var _timeScale;
_timeScale = 1;
if (argument_count == 1) _timeScale = argument0;
if (ground && angle > slopeFactorMinAngle && angle < 360-slopeFactorMinAngle) {
    xSpeed -= (angleSin * slopeFactor) * _timeScale;
}
