/// PlayerActionGrind()

animationFrameSpeed = min(0.18 + abs(xSpeed)/20, 0.4);

PlayerXMovementExt(xAcceleration, 0, xSpeedTop);

var _pitch;
_pitch = min(max(0.6, abs(xSpeed)/8), 1.2);
if (grind == 0) {
    if (!sound_isplaying("snd/PlayerGrindContinue")) {
        grind = PlaySoundExt("snd/PlayerGrindContinue", global.volumeSounds, _pitch, false);
    }
}
else {
    sound_pitch(grind, _pitch);
    if (!sound_isplaying("snd/PlayerGrindContinue")) {
        grind = PlaySoundExt("snd/PlayerGrindContinue", global.volumeSounds, _pitch, false);
    }
}

if (keyDown && abs(xSpeed) > 0.1) {
    AnimationApply("GRIND_2");
    xSpeed -= 0.06 * xDirection;
    // Physics
    if (sign(xSpeed) == sign(angleSin)) {
        xSpeed -= rollDecelerationSlopeUp * angleSin;
    }
    if (sign(xSpeed) != sign(angleSin)) {
        xSpeed -= rollDecelerationSlopeDown * angleSin;
    }
}

if (!keyDown) {
    AnimationApply("GRIND_1");
}

// Stop grinding if the player is not colliding with a rail
if (!PlayerCollisionObjectBottom(x, y, angle, maskBig, parRail) && !PlayerCollisionObjectMain(x, y, parRail)
&& !PlayerCollisionObjectBottom(x, y, angle, maskBig, parRailLayer0) && !PlayerCollisionObjectMain(x, y, parRailLayer0)
&& !PlayerCollisionObjectBottom(x, y, angle, maskBig, parRailLayer1) && !PlayerCollisionObjectMain(x, y, parRailLayer1)) {
    PlayerSetAction(PlayerActionNormal);
}

xDirection = esign(xSpeed, xDirection);

PlayerJump();
PlayerBoost(false);
