/// PlayerStateSpindash()
if (stateEntering) {
    spindashStrength = 0;
    exit;
}
if (stateExiting) {
    exit;
}

// Animations
// Normal animation
if (spindashStrength < 0.9) {
    AnimationApply("SPINDASH");
}
// Charging animation
else {
    AnimationApply("SPINDASH_CHARGE");
}

// Charge spindash
if (keyActionPressed) {
    // Increase strength
    if (spindashStrength < spindashStrengthMax) {
        spindashStrength += 2;
    }
    else {
        spindashStrength = spindashStrengthMax;
    }

    // Create charge effect
    with (instance_create(x, y, objSpindashCharge)) {
        image_blend = other.trailColor;
        image_xscale = 0.0006;
        image_yscale = 0.0006;
        scalespeed = max(0.2, 0.2 + other.spindashStrength/50);
    }
    PlaySoundSingle(sndPlayerSpindash, global.soundVolume, 1 + (spindashStrength * 0.043));
}

// Decrease strength while doing nothing
if (spindashStrength > 0) {
    spindashStrength -= 0.15;
}

// Release spindash and start rolling
if (!keyDown) {
    // Create release trail if is charging the spindash
    if (spindashStrength > 0.9) {
        DummyEffectCreate(floor(x), floor(y), sprPlayerSpindashHighRelease, 0.35, 0, 0.1, bm_normal, image_alpha, xDirection, 1, image_angle);
    }
    xSpeed = (8.2 + spindashStrength) * xDirection;
    StatesSet(PlayerStateRoll);
    trailTimer = 120;

    audio_stop(sndPlayerSpindash);
    PlaySound(sndPlayerSpindashRelease);
}
