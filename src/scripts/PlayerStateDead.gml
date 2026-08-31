/// PlayerStateDead()
if (stateEntering) {
    ySpeed = -6;
    canMove = false;
    if (instance_exists(cam)) {
        if (cam.target == id) cam.target = noone;
    }
    PlayerSetGround(false);
    AnimationPlay("DEAD");
    PlaySound(sndPlayerHurt);
    PlaySound(voiceline[4]);
    exit;
}
if (stateExiting) {
    exit;
}

y += ySpeed;
ySpeed += 0.18;

invincibilityTimer = 300;
invincibility = InvincibilityHurt;

if (stateTimer >= 210) {
    RoomRestart();
}
