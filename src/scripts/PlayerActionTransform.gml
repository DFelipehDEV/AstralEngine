/// PlayerActionTransform()

ySpeed = -0.1;
if (animation == "TRANSFORM") {
    if (animationFinished) {
        PlayerSetAction(PlayerActionNormal);
        PlayerSetCharacter(CharacterSuperSonic);
        alarm[1] = 60;
    }


    if (round(animationFrame) == 5 && !sound_isplaying("snd/PlayerTransform")) {
        PlaySound("snd/PlayerTransform")
        instance_create(x, y, objVFXBoostShockwave);
        with (cam)
            CameraShakeY(20);
    }
}
