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
    if (stateTimer > 60) {
        StatesSet(PlayerStateAir);
        PlayerSetCharacter(CharacterSuperSonic);
        AnimationPlay("LANDING");
        alarm[1] = 60;
    }


    if (round(image_index) == 5 && !audio_isplaying(sndPlayerTransform)) {
        PlaySound(sndPlayerTransform)
        instance_create(x, y, objBoostShockwave);
        with (cam)
            CameraShakeY(20);
    }
}
