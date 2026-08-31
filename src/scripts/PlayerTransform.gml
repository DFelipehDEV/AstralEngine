/// PlayerTransform()
if (hasTransform && rings >= 50 && transformInto != -1) {
    if (keyTransformPressed || (keyTransformL && keyTransformR)) {
        xSpeed = 0;
        ySpeed = 0;
        PlayerSetGround(false);
        StatesSet(PlayerStateTransform);
    }
}
