/// PlayerStateGrind()
if (stateEntering) {
    AnimationApply("GRIND");
    grindSound = PlaySound(sndPlayerGrind, 1, 1, true);
    exit;
}

if (stateExiting) {
    audio_stop(grindSound);
    grindSound = -1;
    exit;
}

PlayerMoveX(xAcceleration, 0, xTopSpeed);

var _pitch;
_pitch = min(max(0.6, abs(xSpeed)/8), 1.2);
if (grindSound != -1) {
    audio_set_pitch(grindSound, _pitch);
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
animationSpeed = min(0.18 + abs(xSpeed)/20, 0.4);

// Stop grinding if the player is not colliding with a rail
if (!PlayerCollisionObjectBottom(x, y, angle, maskBig, objRail) && !PlayerCollisionObjectMain(x, y, objRail)
&& !PlayerCollisionObjectBottom(x, y, angle, maskBig, objRailLayer0) && !PlayerCollisionObjectMain(x, y, objRailLayer0)
&& !PlayerCollisionObjectBottom(x, y, angle, maskBig, objRailLayer1) && !PlayerCollisionObjectMain(x, y, objRailLayer1)) {
    StatesSet(PlayerStateNormal);
}

xDirection = esign(xSpeed, xDirection);

PlayerJump();
PlayerBoost(false);
