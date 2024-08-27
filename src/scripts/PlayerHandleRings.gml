/// PlayerHandleRings()

var _ringNormal, _ringDrop, _ringMagnetic, _ringHyper, _ring5, _ring10, _ringSpecial;
_ringNormal = PlayerCollisionHitbox(x, y, objRing);
_ringDrop = PlayerCollisionHitbox(x, y, objRingDrop);
_ringMagnetic = PlayerCollisionHitbox(x, y, objRingMagnetic);
_ringHyper = PlayerCollisionHitbox(x, y, objRingHyper);
_ring5 = PlayerCollisionHitbox(x, y, objRing5);
_ring10 = PlayerCollisionHitbox(x, y, objRing10);
_ringSpecial = PlayerCollisionHitbox(x, y, objRingSpecial);

if (_ringNormal != noone) {
    global.playerRings += 1;
    with (_ringNormal) {
        instance_create(x, y, objVFXRing);
        PlaySoundSingle("snd/Ring", global.volumeSounds, 1);
        instance_destroy();
    }

    if (action != PlayerActionLightspeed) {
        PlayerAddEnergy(4);
    }
}

if (_ringDrop != noone && (action != PlayerActionHurt && invincibilityTime < 100)) {
    global.playerRings += 1;
    with (_ringDrop) {
        instance_create(x, y, objVFXRing);
        PlaySoundSingle("snd/Ring", global.volumeSounds, 1);
        instance_destroy();
    }
}

if (_ringMagnetic != noone) {
    global.playerRings += 1;
    with (_ringMagnetic) {
        instance_create(x, y, objVFXRing);
        PlaySoundSingle("snd/Ring", global.volumeSounds, 1);
        instance_destroy();
    }
    PlayerAddEnergy(4);
}

if (_ringHyper != noone && (action != PlayerActionHurt && invincibilityTime < 100)) {
    global.playerRings += round(_ringHyper.value);
    with (_ringHyper) {
        instance_create(x, y, objVFXRing);
        PlaySoundSingle("snd/Ring", global.volumeSounds, 1);
        instance_destroy();
    }
}

if (_ring5 != noone) {
    global.playerRings += 5;
    with (_ring5) {
        with (instance_create(x, y, objVFXRing)) {
            sparkleOffset = 20;
        }
        with (instance_create(x, y, objVFXRingNumber)) {
            image_index = 0;
            image_speed = 0;
        }
        PlaySoundSingle("snd/RingSuper", global.volumeSounds, 1);
        instance_destroy();
    }
}

if (_ring10 != noone) {
    global.playerRings += 10;
    with (_ring10) {
        with(instance_create(x, y, objVFXRing)) {
            sparkleOffset = 20;
        }
        with (instance_create(x, y, objVFXRingNumber)) {
            image_index = 1;
            image_speed = 0;
        }
        PlaySoundSingle("snd/RingSuper", global.volumeSounds, 1);
        instance_destroy();
    }
}

if (_ringSpecial != noone) {
    global.playerRings += 50;
    with (_ringSpecial) {
        with(instance_create(x, y, objVFXRing)) {
            sparkleOffset = 30;
        }
        PlaySoundSingle("snd/RingSpecial", global.volumeSounds, 1);
        instance_destroy();
    }
    PlayerAddEnergy(4);
}