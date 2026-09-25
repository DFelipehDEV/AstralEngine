/// PlayerStatePush()
if (stateEntering) {
    AnimationPlay("PUSH");
    exit;
}
if (stateExiting) {
    exit;
}

var _wallRight, _wallLeft;
_wallRight = PlayerCollisionRight(x, y, angle, maskBig) || (PlayerCollisionObjectRight(x, y, angle, maskBig, objSlidepassSensor) != noone);
_wallLeft = PlayerCollisionLeft(x, y, angle, maskBig) || (PlayerCollisionObjectLeft(x, y, angle, maskBig, objSlidepassSensor) != noone);

if ((!keyLeft && !keyRight)
|| (keyRight && !_wallRight)
|| (keyLeft && !_wallLeft)
|| (!keyLeft && _wallLeft)
|| (!keyRight && _wallRight)) {
    StatesSet(PlayerStateNormal);
}

PlayerJump();
