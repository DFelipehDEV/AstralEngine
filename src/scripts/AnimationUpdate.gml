/// AnimationUpdate()
animationTime += global.timeScale;

if (!animationFinished) {
    image_index += animationSpeed * global.timeScale;

    if (floor(image_index) > image_number - 1) {
        // Repeat animation
        if (animationRepeat && (animationRepeatTimes > 0 || animationRepeatTimes == -1)) {
            image_index = animationLoopFrame;

            if (animationRepeatTimes > 0) {
                animationRepeatTimes -= 1;
            }
        } else {
            // Stop animation
            // If the animation is not linked to another animation, end animation
            if (animationLinkedTo == "") {
                image_index = image_number;
                animationFinished = true;
            } else {
                AnimationApply(animationLinkedTo);
            }
        }
    }
}
