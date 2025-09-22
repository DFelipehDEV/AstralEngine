/// PlayerStateDead()
if (stateEntering) {
    ySpeed = -6;
    canMove = false;
    if (cam.target == id) cam.target = noone;
    PlayerSetGround(false);
    AnimationApply("DEAD");
    PlaySound(sndPlayerHurt);
    PlaySound(voiceline[4]);
    exit;
}
if (stateExiting) {
    exit;
}

y += ySpeed;
ySpeed += 0.18;
global.playerRings = 0;

invincibilityTimer = 300;
invincibility = InvincibilityHurt;

if (stateTimer >= 210) {
    room_restart();
}
