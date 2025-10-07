/// PlayerAirdash()
// Add this to a state script when you want airdash to be able to be performed

// Air dash
if (keyActionPressed && !ground && canAirdash && !instance_exists(homingReticle)) {
    if (keyLeft) {
        xSpeed = -11;
    } else if (keyRight) {
        xSpeed = 11;
    } else {
        xSpeed = 11 * xDirection;
    }
    ySpeed = 0;
    StatesSet(PlayerStateAirdash);
    trailTimer = 60;

    PlaySound(sndPlayerHome);
    CreateDummy(x, y, sprBoostWave, 0.4, 0, -0.01, bm_normal, 1, xDirection/1.5, 0.6, 0);
}
