/// AnimationIndexSuperSonic()
// Super Sonic animations

AnimationIndexSonic();
switch(animation) {
    case "IDLE":
        AnimationSet(sprSuperSonicIdle, 0, -1, -1, 0.17, 1, 1, -1, "");
        break;

    case "WALK":
        AnimationSet(sprSuperSonicWalk1, 0, -1, -1, 0, 0, 1, -1, "");
        break;

    case "WALK_2":
        AnimationSet(sprSuperSonicWalk2, 0, -1, -1, 0, 0, 1, -1, "");
        break;

    case "JOG":
        AnimationSet(sprSuperSonicJog1, 0, -1, -1, 0, 0, 1, -1, "");
        break;

    case "JOG_2":
    case "RUN":
        AnimationSet(sprSuperSonicRun, 0, -1, -1, 0, 0, 1, -1, "");
        break;
}
