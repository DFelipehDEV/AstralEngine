/// PlayerAirdash()
// Add this to a state script when you want airdash to be able to be performed

// Air dash
if (keyActionPressed && !ground && canAirdash && !instance_exists(homingReticle)) {
    PlayerSetState(PlayerStateAirdash);
    trailTimer = 60;

    PlaySound("snd/PlayerHome");
    DummyEffectCreate(x, y, sprBoostWave, 0.4, 0, -0.01, bm_normal, 1, xDirection/1.5, 0.6, 0);
}
