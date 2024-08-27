/// AnimationInit(AnimationList)

animationAnimationList = argument0;

animation = "";                // Current animation
animationPrevious = "";        // Last animation

animationSprite = 0;                // Current animation sprite

animationFrame = 0;                 // Current animation frame

animationFrameStart = 0;            // First animation frame
animationFrameEnd = 0;              // Last animation frame
animationFrameLoop = 0;             // Looping animation frame
animationFrameRepeat = 0;           // Checks if the animation repeats
animationFrameRepeatTimes = 0;      // How many times the animation repeats

animationFrameSpeed = 0;            // Animation speed
animationFrameReset = 0;            // If true and the animation ended, back to the normal frame

animationLinkedTo = "";             // Animation linked to...

animationFinished = 0;              // Used to check if the animation has ended
animationAngle = 0;                 // Sprite angle for the animation

animationTime = 0;                  // Time since the animation was last updated
