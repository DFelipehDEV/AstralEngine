/// PlayerStateTransform()

ySpeed = -0.1;
if (animation == "TRANSFORM") {
    if (stateTimer > 60) {
        PlayerSetState(PlayerStateNormal);
        PlayerSetCharacter(CharacterSuperSonic);
        alarm[1] = 60;
    }


    if (round(image_index) == 5 && !sound_isplaying("snd/PlayerTransform")) {
        PlaySound("snd/PlayerTransform")
        instance_create(x, y, objBoostShockwave);
        with (cam)
            CameraShakeY(20);
    }
}
