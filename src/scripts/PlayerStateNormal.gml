/// PlayerStateNormal()
if (stateEntering) {
    exit;
}
if (stateExiting) {
    exit;
}

PlayerMoveX();

if (xSpeed == 0) {
    image_angle = 0;
    if (!edgeCollision) {
        var _left, _right;
        _left = PlayerCollisionLeftEdge(x, y, angle);
        _right = PlayerCollisionRightEdge(x, y, angle);
        if (_left && !_right) {
            if (animation != "LEDGE" && animation != "LEDGE_2")
                PlayVoice(choose(voiceline[11], voiceline[12], -1));

            if (xDirection == 1)
                AnimationApply("LEDGE");
            else
                AnimationApply("LEDGE_2");
        } else if (!_left && _right) {
            if (animation != "LEDGE" && animation != "LEDGE_2")
                PlayVoice(choose(voiceline[11], voiceline[12]));

            if (xDirection == 1)
                AnimationApply("LEDGE_2");
            else
                AnimationApply("LEDGE");
        }
    } else {
        if (animation != "IDLE_WAIT" && animation != "IDLE_WAIT_2") {
            AnimationApply("IDLE");
            if (animationTime == 300)
                AnimationApply(choose("IDLE_WAIT", "IDLE_WAIT_2"));
        }
    }
} else { // Moving animations
    if (abs(xSpeed) < 2.25)
        AnimationApply("WALK");
    else if (abs(xSpeed) < 3.5)
        AnimationApply("WALK_2");
    else if (abs(xSpeed) < 5.5)
        AnimationApply("JOG");
    else if (abs(xSpeed) < 9.7)
        AnimationApply("JOG_2");
    else
        AnimationApply("RUN");

    PlayerRotateSpriteToAngle();
}

// Adjust animation speed based on movement speed
if (animation == "WALK" || animation == "WALK_2" || animation == "JOG"
|| animation == "JOG_2" || animation == "RUN")
    animationSpeed = min(0.12 + abs(xSpeed) / 28, 0.62);

// Turn!
if (abs(xSpeed) < 1 && ((xDirection == -1 && keyRight) || (xDirection == 1 && keyLeft))) {
    xSpeed = 0;
    AnimationApply("TURN");
    StatesSet(PlayerStateTurn);
    //exit;
}

if (xSpeed == 0) {
    if (!keyDown && keyUp)
        StatesSet(PlayerStateLookup);
    else if (keyDown && !keyUp)
        StatesSet(PlayerStateCrouch);
}

if ((xSpeed >= 4 && keyLeft) || (xSpeed <= -4 && keyRight)) {
    PlayerHandleFootstepSensors();
    StatesSet(PlayerStateSkid);
    PlaySound(terrainSound[TerSkid]);
}

if (abs(xSpeed) > 1 && keySlide) {
    PlayVoice(choose(voiceline[3], voiceline[2]));
    PlaySound(sndPlayerSlide);
    StatesSet(PlayerStateSlide);
    if (abs(xSpeed) < 7) {
        xSpeed = 7 * xDirection;
    }
}

xDirection = esign(xSpeed, xDirection);

if (!ground) {
    StatesSet(PlayerStateAir);
    AnimationApply("LANDING");
}

PlayerJump();
PlayerLightspeed();
PlayerBoost(true);
