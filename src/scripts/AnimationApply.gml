/// AnimationApply(Animation)
if (animation != argument0) {
    animationPrevious = animation;
    animation = argument0;
    script_execute(animationList);

    // Reset the animation frame if needed
    if (animationResetFrame) {
        image_index = animationStartFrame;
    }

    // Reset animation state
    animationFinished = false;
    animationTime = 0;
}
