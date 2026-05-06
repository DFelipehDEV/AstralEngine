/// PlayerHurt()
if (invincibilityTimer == 0 && invincibility != InvincibilityHurt && character != CharacterSuperSonic) {
    // Knockback the player
    if (sign(xSpeed) != 0) {
        xSpeed = -2.7 * sign(xSpeed);
        xDirection = -sign(xSpeed);
    } else {
        xSpeed = -2.7 * xDirection;
    }

    invincibility = InvincibilityHurt;
    ySpeed = -4;
    PlayerSetGround(false);

    if (shield) {
        shield = ShieldNoone;
        StatesSet(PlayerStateHurt);

        instance_destroy_id(shieldInstance);
        PlayVoice(voiceline[5]);
    } else {
        if (rings != 0) {
            if (combineActive) {
                combineActive = false;
                CreateDroppedHyperRings(max(1, floor(min(rings/8, 8))));
                rings = 0;
                StatesSet(PlayerStateHurt);
                PlayVoice(voiceline[5]);
            } else {
                CreateDroppedRings(min(20, rings));

                if (rings < 50) {
                    rings = 0;
                } else {
                    // Only loose 60% of the rings instead of all of them
                    rings = floor(rings*0.4);
                }

                StatesSet(PlayerStateHurt);
                PlayVoice(voiceline[5]);
            }
            PlaySound(sndPlayerLoseRings);
        } else {
            StatesSet(PlayerStateDead);
        }
    }
    PlayerSetAngle(0);
}
