/// PlayerHandleSprings()

var _spring;
_spring = PlayerCollisionHitbox(x, y, objSpring);

if (_spring != noone) {
    if (!PlayerCollisionHitbox(xprevious, yprevious, _spring)) {
        xSpeed = _spring.strength * dcos(_spring.image_angle + 90);
        ySpeed = -_spring.strength * dsin(_spring.image_angle + 90);
        if (abs(ySpeed) > 0.5) {
            StatesSet(PlayerStateSpring);
            PlayerSetGround(false);
            PlayerSetAngle(0);
        }
        _spring.image_speed = 0.25;
        _spring.image_index = 1;

        PlaySound(sndSpring);
    }
}
