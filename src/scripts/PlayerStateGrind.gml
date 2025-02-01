/// PlayerStateGrind()

animationSpeed = min(0.18 + abs(xSpeed)/20, 0.4);

PlayerXMovementExt(xAcceleration, 0, xSpeedTop);

var _pitch;
_pitch = min(max(0.6, abs(xSpeed)/8), 1.2);
if (grind == 0) {
    if (!audio_isplaying(sndPlayerGrind)) {
        grind = PlaySoundExt(sndPlayerGrind, global.soundVolume, _pitch, false);
    }
}
else {
    audio_set_pitch(grind, _pitch);
    if (!audio_isplaying(sndPlayerGrind)) {
        grind = PlaySoundExt(sndPlayerGrind, global.soundVolume, _pitch, false);
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
    AnimationApply("GRIND");
}

// Stop grinding if the player is not colliding with a rail
if (!PlayerCollisionObjectBottom(x, y, angle, maskBig, objRail) && !PlayerCollisionObjectMain(x, y, objRail)
&& !PlayerCollisionObjectBottom(x, y, angle, maskBig, objRailLayer0) && !PlayerCollisionObjectMain(x, y, objRailLayer0)
&& !PlayerCollisionObjectBottom(x, y, angle, maskBig, objRailLayer1) && !PlayerCollisionObjectMain(x, y, objRailLayer1)) {
    PlayerSetState(PlayerStateNormal);
}

xDirection = esign(xSpeed, xDirection);

PlayerJump();
PlayerBoost(false);
