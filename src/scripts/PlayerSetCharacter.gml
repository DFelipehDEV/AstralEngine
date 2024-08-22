/// PlayerSetCharacter(character)
character = argument0;
switch (character) {
    case CharacterSonic:
        PlayerSetVoicelines(CharacterSonic);
        character = CharacterSonic;
        characterPhysics = PlayerPhysicsSonic;
        animationAnimationList = AnimationIndexSonic;

        afterimageColor1 = c_teal;
        afterimageColor2 = c_blue;
        trailColor = make_color_rgb(25,100,255);
        boostSprite = sprVFXBoost;
        break;
    case CharacterSuperSonic:
        PlayerSetVoicelines(CharacterSonic);
        character = CharacterSuperSonic;
        characterPhysics = PlayerPhysicsSuperSonic;
        animationAnimationList = AnimationIndexSuperSonic;

        afterimageColor1 = c_orange;
        afterimageColor2 = c_yellow;
        trailColor = make_color_rgb(255,163,25);
        boostSprite = sprVFXBoostSuper;
        break;
}
PlayerPhysicModeSet(physicsMode);
AnimationUpdate();
