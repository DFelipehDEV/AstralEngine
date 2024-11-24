/// AnimationInit(AnimationList)

animationList = argument0;

image_speed = 0;
animation = "";
animationPrevious = "";

animationStartFrame = 0; // First animation frame
animationEndFrame = 0; // Last animation frame
animationLoopFrame = 0; // Loop animation frame

animationRepeat = false;
animationRepeatTimes = 0; // How many times the animation repeats
animationResetFrame = false; // If true and the animation ended, back to the normal frame

animationSpeed = 0; // Animation speed

animationLinkedTo = "";

animationFinished = false;
animationAngle = 0;

animationTime = 0; // Time since the animation was last changed
