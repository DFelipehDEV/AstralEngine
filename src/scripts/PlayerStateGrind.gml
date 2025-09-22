/// PlayerStateGrind()
if (stateEntering) {
    AnimationApply("GRIND");
    grind = 0;
    exit;
}

if (stateExiting) {
    audio_stop(sndPlayerGrind);
    exit;
}
animationSpeed = min(0.18 + abs(xSpeed)/20, 0.4);

PlayerMoveX(xAcceleration, 0, xTopSpeed);

var _pitch;
_pitch = min(max(0.6, abs(xSpeed)/8), 1.2);
if (grind == 0) {
    if (!audio_isplaying(sndPlayerGrind)) {
        grind = PlaySound(sndPlayerGrind, global.soundVolume, _pitch, false);
    }
}
else {
    audio_set_pitch(grind, _pitch);
    if (!audio_isplaying(sndPlayerGrind)) {
        grind = PlaySound(sndPlayerGrind, global.soundVolume, _pitch, false);
    }
}

if (keyDown && abs(xSpeed) > 0.1) {
    AnimationApply("GRIND_2");
    xSpeed -= 0.06 * xDirection;
    // Physics
    if (sign(xSpeed) == sign(angleSin)) {
        xSpeed -= rollUphillFriction * angleSin;
    }
    if (sign(xSpeed) != sign(angleSin)) {
        xSpeed -= rollDownhillForce * angleSin;
    }
}

if (!keyDown) {
    AnimationApply("GRIND");
}

// Stop grinding if the player is not colliding with a rail
if (!PlayerCollisionObjectBottom(x, y, angle, maskBig, objRail) && !PlayerCollisionObjectMain(x, y, objRail)
&& !PlayerCollisionObjectBottom(x, y, angle, maskBig, objRailLayer0) && !PlayerCollisionObjectMain(x, y, objRailLayer0)
&& !PlayerCollisionObjectBottom(x, y, angle, maskBig, objRailLayer1) && !PlayerCollisionObjectMain(x, y, objRailLayer1)) {
    StatesSet(PlayerStateNormal);
}

xDirection = esign(xSpeed, xDirection);

PlayerJump();
PlayerBoost(false);
