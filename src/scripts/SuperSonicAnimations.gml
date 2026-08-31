/// SuperSonicAnimations()
SonicAnimations();
switch(animation) {
    case "IDLE":
        AnimationSet(sprSuperSonicIdle, 0.17);
        break;

    case "WALK":
        AnimationSet(sprSuperSonicWalk1, 0);
        break;

    case "WALK_2":
        AnimationSet(sprSuperSonicWalk2, 0);
        break;

    case "JOG":
        AnimationSet(sprSuperSonicJog1, 0);
        break;

    case "JOG_2":
    case "RUN":
        AnimationSet(sprSuperSonicRun, 0);
        break;
}
