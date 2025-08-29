/// PlayerHurt()
if (invincibilityTimer == 0 && invincibility != InvincibilityHurt && character != CharacterSuperSonic) {
    // Set player to its opposite direction
    if (sign(xSpeed) != 0) {
        xSpeed = -2.7*sign(xSpeed);
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
        PlayerSetState(PlayerStateHurt);

        instance_destroy_id(shieldInstance);
        PlayVoice(voiceline[5]);
    }
    else {
        // Check if the player has rings
        if (global.playerRings != 0) {
            // Check if we have the combine ring monitor effect
            if (combineActive) {
                combineActive = false;

                // Steal rings from the player
                RingsDropHyper(true, max(1, floor(min(global.playerRings/8, 8))));

                global.playerRings = 0;
                PlayerSetState(PlayerStateHurt);
                PlayVoice(voiceline[5]);
            }
            else {
                // Drop rings
                // Steal rings from the player
                RingsDrop(true, min(20, global.playerRings));

                // Check if the player has more than 50 rings
                if (global.playerRings < 50) {
                    global.playerRings = 0;
                }
                else {
                    // Only loose 60% of the rings instead of all of them
                    global.playerRings = floor(global.playerRings*0.4);
                }

                PlayerSetState(PlayerStateHurt);
                PlayVoice(voiceline[5]);
            }
        }
        else {
            PlayerSetState(PlayerStateDead);
            global.playerRings = 0;
        }
    }
    PlayerSetAngle(0);
}
