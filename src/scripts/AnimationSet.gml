/// AnimationSet(sprite, [speed=0], [frameToLoop=0], [repeatTimes=infinity], [linkedAnimation=""])
sprite_index = argument0;
animationSpeed = 0;
animationLoopFrame = 0;
animationRepeatTimes = infinity;
animationLinkedTo = "";

switch (argument_count) {
    case 5:
        animationLinkedTo = argument4;
    case 4:
        animationRepeatTimes = argument3;
    case 3:
        animationLoopFrame = argument2;
    case 2:
        animationSpeed = argument1;
        break;
}
