/// AnimationSystem(Animations)
// Animation system

animationTime += global.timeScale;

if (!animationFinished) {
    image_index += animationSpeed * global.timeScale;

    if (floor(image_index) > animationEndFrame) {
        // Repeat animation
        if (animationRepeat && (animationRepeatTimes > 0 || animationRepeatTimes == -1)) {
            image_index = animationLoopFrame;

            if (animationRepeatTimes > 0) {
                animationRepeatTimes -= 1;
            }
        }
        else {
            // Stop animation
            // If the animation is not linked to another animation, end animation
            if (animationLinkedTo == "") {
                image_index = animationEndFrame;
                animationFinished = true;
            }
            else {
                // If it is linked to another animation, set that animation
                image_index = animationEndFrame;

                animationPrevious = animation;
                animation = animationLinkedTo;

                script_execute(argument0);

                animationTime = 0;
                animationFinished = false;

                // Reset the frame if animationResetFrame is toggled
                if (animationResetFrame) {
                    image_index = animationStartFrame;
                }
            }
        }
    }
}
