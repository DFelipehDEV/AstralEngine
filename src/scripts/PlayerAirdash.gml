/// PlayerAirdash()
// Add this to a action script when you want airdash to be able to be performed

// Air dash
if (keyActionPressed && !ground && airdashPossible && !instance_exists(homingReticle)) {
    PlayerSetAction(PlayerActionAirdash);
    trailTimer = 60;

    PlaySound("snd/PlayerHome");
    DummyEffectCreate(x, y, sprBoostWave, 0.4, 0, -0.01, bm_normal, 1, xDirection/1.5, 0.6, 0);
}
