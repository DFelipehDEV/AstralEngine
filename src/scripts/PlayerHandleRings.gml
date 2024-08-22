/// PlayerHandleRings()
// Handle rings collision


var _ringNormal, _ringDrop, _ringMagnetic, _ringHyper, _ring5, _ring10, _ringSpecial;
_ringNormal = PlayerCollisionHitbox(x, y, objRing);
_ringDrop = PlayerCollisionHitbox(x, y, objRingDrop);
_ringMagnetic = PlayerCollisionHitbox(x, y, objRingMagnetic);
_ringHyper = PlayerCollisionHitbox(x, y, objRingHyper);
_ring5 = PlayerCollisionHitbox(x, y, objRing5);
_ring10 = PlayerCollisionHitbox(x, y, objRing10);
_ringSpecial = PlayerCollisionHitbox(x, y, objRingSpecial);
// Collect normal ring
if (_ringNormal != noone) {
    global.playerRings += 1;
    // Destroy ring and create effect
    with (_ringNormal) {
        instance_create(x, y, objVFXRing);
        PlaySoundSingle("sndRing", global.volumeSounds, 1);
        instance_destroy();
    }

    if (action != PlayerActionLightspeed) {
        // Get energy
        PlayerAddEnergy(4);
    }
}


// Collect dropped ring
if (_ringDrop != noone && (action != PlayerActionHurt && invincibilityTime < 100)) {
    global.playerRings += 1;
    // Destroy ring and create effect
    with (_ringDrop) {
        instance_create(x, y, objVFXRing);
        PlaySoundSingle("sndRing", global.volumeSounds, 1);
        instance_destroy();
    }
}

// Collect magnetic ring
if (_ringMagnetic != noone) {
    global.playerRings += 1;
    // Destroy ring and create effect
    with (_ringMagnetic) {
        instance_create(x, y, objVFXRing);
        PlaySoundSingle("sndRing", global.volumeSounds, 1);
        instance_destroy();
    }
    // Get energy
    PlayerAddEnergy(4);
}

// Collect dropped ring
if (_ringHyper != noone && (action != PlayerActionHurt && invincibilityTime < 100)) {
    global.playerRings += round(_ringHyper.value);
    // Destroy ring and create effect
    with (_ringHyper) {
        instance_create(x, y, objVFXRing);
        PlaySoundSingle("sndRing", global.volumeSounds, 1);
        instance_destroy();
    }
}

// Collect dropped ring
if (_ring5 != noone) {
    global.playerRings += 5;
    // Destroy ring and create effect
    with (_ring5) {
        with (instance_create(x, y, objVFXRing)) {
            sparkleOffset = 20;
        }
        with (instance_create(x, y, objVFXRingNumber)) {
            image_index = 0;
            image_speed = 0;
        }
        PlaySoundSingle("sndRingSuper", global.volumeSounds, 1);
        instance_destroy();
    }
}

// Collect ring 10
if (_ring10 != noone) {
    global.playerRings += 10;
    // Destroy ring and create effect
    with (_ring10) {
        with(instance_create(x, y, objVFXRing)) {
            sparkleOffset = 20;
        }
        with (instance_create(x, y, objVFXRingNumber)) {
            image_index = 1;
            image_speed = 0;
        }
        PlaySoundSingle("sndRingSuper", global.volumeSounds, 1);
        instance_destroy();
    }
}

// Collect special ring
if (_ringSpecial != noone) {
    global.playerRings += 50;
    // Destroy ring and create effect
    with (_ringSpecial) {
        with(instance_create(x, y, objVFXRing)) {
            sparkleOffset = 30;
        }
        PlaySoundSingle("sndRingSpecial", global.volumeSounds, 1);
        instance_destroy();
    }
    // Get energy
    PlayerAddEnergy(4);
}
