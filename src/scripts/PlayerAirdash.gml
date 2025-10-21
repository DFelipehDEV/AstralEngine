/// PlayerAirdash()
if (!canAirdash) exit;
if (keyActionPressed && !ground && !instance_exists(homingReticle)) {
    xSpeed = airdashSpeed * PlayerGetInputDirection();
    ySpeed = 0;
    StatesSet(PlayerStateAirdash);
    trailTimer = 60;

    PlaySound(sndPlayerHome);
    CreateDummy(x, y, sprBoostWave, 0.4, 0, -0.01, bm_normal, 1, xDirection/1.5, 0.6, 0);
}
