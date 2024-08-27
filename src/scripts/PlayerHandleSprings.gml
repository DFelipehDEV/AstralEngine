/// PlayerHandleSprings()

var _spring;
_spring = PlayerCollisionHitbox(x, y, parSpring);

if (_spring != noone) {
    xSpeed = _spring.springStrength * dcos(_spring.image_angle + 90);
    ySpeed = -_spring.springStrength * dsin(_spring.image_angle + 90);
    if (abs(ySpeed) > 0.5) {
        PlayerSetAction(PlayerActionSpring);
        ground = false;
        PlayerSetAngle(0);
    }
    allowKeysTimer = 6;
    _spring.image_speed = 0.25;
    _spring.image_index = 1;
    interactDelay = 11;

    PlaySound("snd/Spring");
}
