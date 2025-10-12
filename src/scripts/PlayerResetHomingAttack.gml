/// PlayerResetHomingAttack()
if (state == PlayerStateHomingAttack) {
    if (invincibilityTimer < 25) {
        invincibilityTimer = 25;
    }

    xSpeed = 0;
    ySpeed = -6.5;
    lockKeysTimer = 15;
    StatesSet(PlayerStateAir);
    AnimationApply(choose("HOMED", "HOMED_2", "SPRING_TRICK_VERTICAL"));
}
