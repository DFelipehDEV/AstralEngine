/// PlayerActionPush()

if ((!keyLeft && !keyRight)
|| (keyRight && !PlayerCollisionRight(x, y, angle, maskBig))
|| (keyLeft && !PlayerCollisionLeft(x, y, angle, maskBig))
|| (!keyLeft && PlayerCollisionLeft(x, y, angle, maskBig))
|| (!keyRight && PlayerCollisionRight(x, y, angle, maskBig))) {
    PlayerSetAction(PlayerActionNormal);
}

PlayerJump();
