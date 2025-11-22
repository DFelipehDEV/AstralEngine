/// AnimationUpdate()
animationTime += global.timeScale;

if (!animationFinished) {
    image_index += animationSpeed * global.timeScale;

    if (floor(image_index) > image_number - 1) {
        // Repeat animation
        if (animationRepeatTimes > 0) {
            image_index = animationLoopFrame;
            animationRepeatTimes -= 1;
        } else {
            // Stop animation
            // If the animation is not linked to another animation, end animation
            if (animationLinkedTo == "") {
                image_index = image_number - 1;
                animationFinished = true;
            } else {
                AnimationApply(animationLinkedTo);
            }
        }
    }
}
