/// PlayerHurt()
if (invincibilityTimer == 0 && invincibility != InvincibilityHurt && character != CharacterSuperSonic) {
    // Set player to its opposite direction
    if (sign(xSpeed) != 0) {
        xSpeed = -2.7 * sign(xSpeed);
        xDirection = -sign(xSpeed);
    }
    else {
        xSpeed = -2.7 * xDirection;
    }

    invincibility = InvincibilityHurt;
    ySpeed = -4;
    PlayerSetGround(false);

    // Check if the player has a shield
    if (shield) {
        shield = ShieldNoone;
        StatesSet(PlayerStateHurt);

        instance_destroy_id(shieldInstance);
        PlayVoice(voiceline[5]);
    }
    else {
        // Check if the player has rings
        if (global.playerRings != 0) {
            if (combineActive) {
                combineActive = false;
                CreateDroppedHyperRings(max(1, floor(min(global.playerRings/8, 8))));

                global.playerRings = 0;
                StatesSet(PlayerStateHurt);
                PlayVoice(voiceline[5]);
            }
            else {
                CreateDroppedRings(min(20, global.playerRings));

                if (global.playerRings < 50) {
                    global.playerRings = 0;
                }
                else {
                    // Only loose 60% of the rings instead of all of them
                    global.playerRings = floor(global.playerRings*0.4);
                }

                StatesSet(PlayerStateHurt);
                PlayVoice(voiceline[5]);
            }
            PlaySound(sndPlayerLoseRings);
        }
        else {
            StatesSet(PlayerStateDead);
            global.playerRings = 0;
        }
    }
    PlayerSetAngle(0);
}
