/// AnimationPlay(animation, [resetFrame=true])
var _resetFrame;
_resetFrame = true;
if (argument_count > 1) {
    _resetFrame = argument1;
}

if (animation != argument0) {
    animationPrevious = animation;
    animation = argument0;
    script_execute(animationList);

    if (_resetFrame) {
        image_index = 0;
    }

    // Reset animation state
    animationFinished = false;
    animationTime = 0;
}
