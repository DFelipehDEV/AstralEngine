/// AnimationSet(sprite, [frameToLoop=0], [speed=0], [resetFrame=true], [repeat=true], [repeatTimes=infinity], [linkedAnimation=""])
sprite_index = argument0;
animationLoopFrame = 0;
animationSpeed = 0;
animationResetFrame = true;
animationRepeat = true;
animationRepeatTimes = infinity;
animationLinkedTo = "";

switch (argument_count) {
    case 7:
        animationLinkedTo = argument6;
    case 6:
        animationRepeatTimes = argument5;
    case 5:
        animationRepeat = argument4;
    case 4:
        animationResetFrame = argument3;
    case 3:
        animationSpeed = argument2;
    case 2:
        animationLoopFrame = argument1;
        break;
}
