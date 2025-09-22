/// PlayerStatePush()
if (stateEntering) {
    AnimationApply("PUSH");
    exit;
}
if (stateExiting) {
    exit;
}

if ((!keyLeft && !keyRight)
|| (keyRight && !PlayerCollisionRight(x, y, angle, maskBig))
|| (keyLeft && !PlayerCollisionLeft(x, y, angle, maskBig))
|| (!keyLeft && PlayerCollisionLeft(x, y, angle, maskBig))
|| (!keyRight && PlayerCollisionRight(x, y, angle, maskBig))) {
    StatesSet(PlayerStateNormal);
}

PlayerJump();
