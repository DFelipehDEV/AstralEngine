/// AnimationInit(animationList)

animationList = argument0;

image_speed = 0;
animation = "";
animationPrevious = "";
animationLoopFrame = 0; // Loop animation frame
animationRepeat = false;
animationRepeatTimes = infinity; // How many times the animation repeats
animationResetFrame = true; // If true and the animation ended, back to the first frame
animationSpeed = 0;
animationLinkedTo = "";
animationFinished = false;
animationTime = 0; // Time since the animation was last changed
