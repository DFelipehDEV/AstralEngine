/// AnimationInit(AnimationList)

animationList = argument0;

animation = "";
animationPrevious = "";

animationSprite = 0;
animationFrame = 0;
animationStartFrame = 0; // First animation frame
animationEndFrame = 0; // Last animation frame
animationLoopFrame = 0; // Loop animation frame

animationRepeat = false;
animationRepeatTimes = 0; // How many times the animation repeats
animationResetFrame = false; // If true and the animation ended, back to the normal frame

animationSpeed = 0; // Animation speed
animationSpeedIncremental = 0; // Incremented animation speed. Useful for walking animation based on speed

animationLinkedTo = "";

animationFinished = false;
animationAngle = 0;

animationTime = 0; // Time since the animation was last changed
