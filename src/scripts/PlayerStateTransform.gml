/// PlayerStateTransform()
if (stateEntering) {
    AnimationPlay("TRANSFORM");
    exit;
}
if (stateExiting) {
    exit;
}

ySpeed = -0.1;
if (animation == "TRANSFORM") {
    if (stateTimer >= transformDuration) {
        StatesSet(PlayerStateAir);
        PlayerSetCharacter(CharacterSuperSonic);
        AnimationPlay("LANDING");
        alarm[1] = transformRingDecay;
    }

    if (round(image_index) == 5 && !audio_isplaying(sndPlayerTransform)) {
        PlaySound(sndPlayerTransform)
        instance_create(x, y, objBoostShockwave);
        with (PlayerGetOwnedCamera()) CameraShakeY(20);
    }
}
