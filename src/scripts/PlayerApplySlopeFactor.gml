/// PlayerApplySlopeFactor()
if (ground && angle > slopeFactorMinAngle && angle < 360-slopeFactorMinAngle) {
    xSpeed -= angleSin * slopeFactor;
}
