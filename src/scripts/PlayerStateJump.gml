/// PlayerStateJump()
if (stateEntering) {
    jumpAirTimer = 0;
    boostAirTimer = boostAirTimerMax;
    PlayerResetAirdash();
    AnimationPlay("JUMP");
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();

xDirection = PlayerGetInputDirection();

if (animation != "BREATHE") {
    if (ySpeed < 2) {
        AnimationPlay("JUMP");
        animationSpeed = (0.2 + abs(ySpeed)/7) + abs(xSpeed)/15;
    } else {
        AnimationPlay("LANDING");
    }
}

// Variable jump
if (ySpeed < 0 && jumpAirTimer <= 13 && keyAction) {
    ySpeed += (jumpStrength/(26)) * global.timeScale;
    jumpAirTimer += global.timeScale;
}

// Air drag
if(ySpeed < 0 && ySpeed >= -4) {
   xSpeed -= (sign(xSpeed) * yDrag) * global.timeScale;
}

PlayerTransform();

PlayerHomingAttack();
PlayerAirdash();
PlayerStomp();
PlayerLightspeed();
PlayerBoost(true);

if (ground) {
    StatesSet(PlayerStateNormal);
    PlaySound(terrainSound[TerLand]);
}
