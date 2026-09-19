/// PlayerHandleSprings()
if (!instance_exists(objSpring)) exit;

var _spring;
_spring = PlayerCollisionHitbox(x, y, objSpring);

if (_spring != noone) {
    if (!PlayerCollisionHitbox(xprevious, yprevious, _spring)) {
        var _angle;
        _angle = _spring.image_angle;
        if (_spring.image_yscale < 0) _angle += 180;
        xSpeed = _spring.strength * dcos(_angle + 90);
        ySpeed = -_spring.strength * dsin(_angle + 90);
        if (abs(ySpeed) > 0.05 || !ground) {
            xDirection = esign(xSpeed, xDirection);
            stateTimer = 0; // force state timer so the player plays the spring animation again
            StatesSet(PlayerStateSpring);
            PlayerSetGround(false);
            PlayerSetAngle(0);
        }
        lockKeysTimer = 8;
        with (_spring) event_user(0);
    }
}
