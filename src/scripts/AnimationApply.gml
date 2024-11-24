/// AnimationApply(Animation)
if (animation != argument0) {
    animationPrevious = animation;
    animation = argument0;
    AnimationUpdate();

    // Reset the animation frame if needed
    if (animationResetFrame) {
        image_index = animationStartFrame;
    }

    // Reset animation state
    animationFinished = false;
    animationTime = 0;
}
