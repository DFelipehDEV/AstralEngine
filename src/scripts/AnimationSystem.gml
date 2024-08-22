/// AnimationSystem(Animations)
// Animation system

// Increase the timer since the animation started
animationTime += 1;

// Check if the animation has not ended
if (!animationFinished) {
    // Animate
    animationFrame += animationFrameSpeed * global.deltaMultiplier;

    if (floor(animationFrame) > animationFrameEnd) {
        // Repeat animation
        if (animationFrameRepeat && (animationFrameRepeatTimes > 0 || animationFrameRepeatTimes == -1)) {
            animationFrame = animationFrameLoop;

            if (animationFrameRepeatTimes > 0) {
                animationFrameRepeatTimes -= 1;
            }
        }
        else {
            // Stop animation
            // If the animation is not linked to another animation, end animation
            if (animationLinkedTo == "") {
                animationFrame = animationFrameEnd;
                animationFinished = true;
            }
            else {
                // If it is linked to another animation, set that animation
                animationFrame = animationFrameEnd;

                // Update animation status
                animationIndexPrevious = animationIndex;
                animationIndex = animationLinkedTo;

                script_execute(argument0);

                animationTime = 0;
                animationFinished = false;

                // Reset the frame if animationFrameReset is toggled
                if (animationFrameReset) {
                    animationFrame = animationFrameStart;
                }
            }
        }
    }
}
