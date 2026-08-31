/// PlayerSetCharacter(character)
if (character == argument0) exit;
character = argument0;
switch (character) {
    case CharacterSonic:
        PlayerSetVoicelines(CharacterSonic);
        characterPhysics = SonicPhysics;
        animationList = SonicAnimations;
        transformPrevious = -1;
        transformInto = CharacterSuperSonic;

        afterimageColor1 = c_teal;
        afterimageColor2 = c_blue;
        trailColor = make_color_rgb(25,100,255);
        boostSprite = sprBoost;
        paletteSprite = -1;

        hasSlide = true;
        hasBoost = true;
        hasAirdash = true;
        hasHomingAttack = true;
        hasSpindash = true;
        hasWallJump = true;
        hasLightspeed = true;
        hasStomp = true;
        hasTransform = true;
        break;
    case CharacterSuperSonic:
        PlayerSetVoicelines(CharacterSonic);
        characterPhysics = SuperSonicPhysics;
        animationList = SuperSonicAnimations;
        transformPrevious = CharacterSonic;
        transformInto = -1;

        afterimageColor1 = c_orange;
        afterimageColor2 = c_yellow;
        trailColor = make_color_rgb(255,163,25);
        boostSprite = sprBoostSuper;
        paletteSprite = sprSuperSonicPalette;

        hasSlide = true;
        hasBoost = true;
        hasAirdash = true;
        hasHomingAttack = true;
        hasSpindash = true;
        hasWallJump = true;
        hasLightspeed = true;
        hasStomp = true;
        hasTransform = false;
        break;
}

script_execute(animationList);
PlayerSetPhysicsMode(physicsMode);
