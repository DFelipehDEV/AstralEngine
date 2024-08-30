/// PlayerActionDead()

y += ySpeed;
ySpeed += 0.18;
global.playerRings = 0;

invincibilityTimer = 300;
invincibility = InvincibilityHurt;

// Decrease restart time
if (actionTimer == 210) {
    room_restart();
}
