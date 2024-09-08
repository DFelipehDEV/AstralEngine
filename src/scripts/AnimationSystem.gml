/// AnimationSystem(Animations)
// Animation system

// Increase the timer since the animation started
animationTime += 1;

// Check if the animation has not ended
if (!animationFinished) {
    // Animate
    animationFrame += (animationSpeed + animationSpeedIncremental) * global.deltaMultiplier;

    if (floor(animationFrame) > animationEndFrame) {
        // Repeat animation
        if (animationRepeat && (animationRepeatTimes > 0 || animationRepeatTimes == -1)) {
            animationFrame = animationLoopFrame;

            if (animationRepeatTimes > 0) {
                animationRepeatTimes -= 1;
            }
        }
        else {
            // Stop animation
            // If the animation is not linked to another animation, end animation
            if (animationLinkedTo == "") {
                animationFrame = animationEndFrame;
                animationFinished = true;
            }
            else {
                // If it is linked to another animation, set that animation
                animationFrame = animationEndFrame;

                // Update animation status
                animationPrevious = animation;
                animation = animationLinkedTo;

                script_execute(argument0);

                animationTime = 0;
                animationFinished = false;

                // Reset the frame if animationResetFrame is toggled
                if (animationResetFrame) {
                    animationFrame = animationStartFrame;
                }
            }
        }
    }
}
