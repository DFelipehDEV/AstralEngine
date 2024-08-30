/// PlayerStatePush()

if ((!keyLeft && !keyRight)
|| (keyRight && !PlayerCollisionRight(x, y, angle, maskBig))
|| (keyLeft && !PlayerCollisionLeft(x, y, angle, maskBig))
|| (!keyLeft && PlayerCollisionLeft(x, y, angle, maskBig))
|| (!keyRight && PlayerCollisionRight(x, y, angle, maskBig))) {
    PlayerSetState(PlayerStateNormal);
}

PlayerJump();
