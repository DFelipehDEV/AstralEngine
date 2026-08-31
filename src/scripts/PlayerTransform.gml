/// PlayerTransform()
if (hasTransform && rings >= 50 && character == CharacterSonic) {
    if (keyTransformPressed || (keyTransformL && keyTransformR)) {
        xSpeed = 0;
        ySpeed = 0;
        PlayerSetGround(false);
        StatesSet(PlayerStateTransform);
    }
}
