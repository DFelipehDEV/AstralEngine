/// PlayerSetCharacter(character)
character = argument0;
switch (character) {
    case CharacterSonic:
        PlayerSetVoicelines(CharacterSonic);
        character = CharacterSonic;
        characterPhysics = SonicPhysics;
        animationList = SonicAnimations;

        afterimageColor1 = c_teal;
        afterimageColor2 = c_blue;
        trailColor = make_color_rgb(25,100,255);
        boostSprite = sprBoost;
        break;
    case CharacterSuperSonic:
        PlayerSetVoicelines(CharacterSonic);
        character = CharacterSuperSonic;
        characterPhysics = SuperSonicPhysics;
        animationList = SuperSonicAnimations;

        afterimageColor1 = c_orange;
        afterimageColor2 = c_yellow;
        trailColor = make_color_rgb(255,163,25);
        boostSprite = sprBoostSuper;
        break;
}
PlayerSetPhysicsMode(physicsMode);
