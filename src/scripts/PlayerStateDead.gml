/// PlayerStateDead()

y += ySpeed;
ySpeed += 0.18;
global.playerRings = 0;

invincibilityTimer = 300;
invincibility = InvincibilityHurt;

if (stateTimer == 210) {
    room_restart();
}
