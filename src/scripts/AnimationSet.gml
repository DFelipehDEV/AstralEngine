/// AnimationSet(sprite, [frameToLoop=0], [speed=0], [resetFrame=true], [repeatTimes=infinity], [linkedAnimation=""])
sprite_index = argument0;
animationLoopFrame = 0;
animationSpeed = 0;
animationResetFrame = true;
animationRepeatTimes = infinity;
animationLinkedTo = "";

switch (argument_count) {
    case 6:
        animationLinkedTo = argument5;
    case 5:
        animationRepeatTimes = argument4;
    case 4:
        animationResetFrame = argument3;
    case 3:
        animationSpeed = argument2;
    case 2:
        animationLoopFrame = argument1;
        break;
}
