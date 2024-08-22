/// AnimationApply(Animation)
if (animationIndex != argument0) {
    animationIndexPrevious = animationIndex;
    animationIndex = argument0;
    AnimationUpdate();

    // Reset the animation frame if needed
    if (animationFrameReset) {
        animationFrame = animationFrameStart;
    }

    // Reset animation state
    animationFinished = false;
    animationTime = 0;
}
