/// AnimationSystem(Animations)
// Animation system

animationTime += 1;

if (!animationFinished) {
    animationFrame += (animationSpeed) * global.deltaMultiplier;

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
