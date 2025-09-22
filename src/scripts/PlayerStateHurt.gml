/// PlayerStateHurt()
if (stateEntering) {
    AnimationApply("HURT_FALL");
    exit;
}
if (stateExiting) {
    exit;
}

if (ground) {
    xSpeed = 0;
    invincibility = InvincibilityBlink;
    invincibilityTimer = 170;
    StatesSet(PlayerStateNormal);
}
