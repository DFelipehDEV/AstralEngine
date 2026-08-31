/// AnimationUpdate()
animationTime += global.timeScale;

if (!animationFinished) {
    image_index += animationSpeed * global.timeScale;

    if (image_index >= image_number) {
        // Repeat animation
        if (animationRepeatTimes > 0) {
            image_index = animationLoopFrame + (image_index - image_number);
            animationRepeatTimes -= 1;
        } else {
            // Stop animation
            // If the animation is not linked to another animation, end animation
            if (animationLinkedTo == "") {
                image_index = image_number - 1;
                animationFinished = true;
            } else {
                AnimationPlay(animationLinkedTo);
            }
        }
    }
}
