/// AnimationSet(Sprite, frameStart, frameEnd, frameLoop, frameSpeed, frameReset, frameRepeat, repeatTimes, linkedAnimation)
animationSprite = argument0;
animationFrameStart = argument1;

// Check if the end frame is specified (-1 means use the last frame of the sprite)
if (argument2 == -1) {
    // Use the last frame of the sprite as the end frame
    animationFrameEnd = sprite_get_number(argument0) - 1;
}
else {
    animationFrameEnd = argument2;
}

// Check if the looping frame is specified (-1 means no looping)
if (argument3 == -1) {
    animationFrameLoop = 0;
}
else {
    animationFrameLoop = argument3;
}

animationFrameSpeed = argument4;

// Set whether the animation resets to the normal frame after it ends
animationFrameReset = argument5;
animationFrameRepeat = argument6;
animationFrameRepeatTimes = argument7;

// Set the animation linked to this one (e.g., for transitions between animations)
animationLinkedTo = argument8;
