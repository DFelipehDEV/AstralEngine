/// PlayerSetState(state, [args...])
// Exit state
switch (state) {
    case PlayerStateGrind:
        audio_stop(sndPlayerGrind);
        break;
    case PlayerStateSlide:
        audio_stop(sndPlayerSlide);
        break;
    case PlayerStateStomp:
        PlayerResetSensors();
        break;
}

previousState = state;
state = argument0;
stateTimer = 0;

// Enter state
switch (state) {
    case PlayerStateSpring:
        AnimationApply("SPRING");
        break;
    case PlayerStateTurn:
        keyRight = false;
        keyLeft = false;
        xSpeed = 0;
        AnimationApply("TURN");
        break;

    case PlayerStateJump:
        PlayerResetAirdash();
        AnimationApply("JUMP");
        PlayerSetGround(false);
        jumpAirTimer = 0;
        break;

    case PlayerStateAirdash:
        canAirdash = false;
        AnimationApply("JUMP");
        break;

    case PlayerStateRoll:
        AnimationApply("ROLL");
        break;

    case PlayerStateCrouch:
        AnimationApply("CROUCH");
        break;

    case PlayerStateLookup:
        AnimationApply("LOOK_UP");
        break;

    case PlayerStateSpindash:
        spindashStrength = 0;
        break;

    case PlayerStateSkid:
        AnimationApply("SKID");
        break;

    case PlayerStateHomingAttack:
        PlayerResetAirdash();
        AnimationApply("JUMP");
        break;

    case PlayerStateHomingFlight:
        AnimationApply(choose("HOMED", "HOMED_2", "SPRING_TRICK_VERTICAL"));
        allowKeysTimer = 20;
        break;
    case PlayerStateWalljump:
        xSpeed = 0;
        AnimationApply("WALLGRAB");
        break;

    case PlayerStateGrind:
        AnimationApply("GRIND");
        grind = 0;
        break;

    case PlayerStateSlide:
        slideCancelTimer = 35;
        AnimationApply("SLIDE");
        break;

    case PlayerStateStomp:
        AnimationApply("STOMP");
        trailTimer = 80;
        sensorBottomDistance = 14;
        image_angle = 0;
        break;

    case PlayerStateStompLand:
        AnimationApply("STOMP_LAND");
        PlayerResetSensors();
        break;

    case PlayerStateLightspeed:
        AnimationApply("SPRING");
        break;

    case PlayerStatePush:
        AnimationApply("PUSH");
        break;

    case PlayerStateWaylauncher:
        xSpeed = 0;
        ySpeed = 0;
        break;

    case PlayerStateBoostAir:
        boostAirTimer = 80;
        canBoost = true;
        AnimationApply("LAUNCH");
        break;

    case PlayerStateTransform:
        AnimationApply("TRANSFORM");
        break;

    case PlayerStateHurt:
        AnimationApply("HURT_FALL");
        break;

    case PlayerStateDead:
        ySpeed = -6;
        PlayerSetGround(false);
        canMove = false;
        if (cam.target == id) cam.target = noone;
        AnimationApply("DEAD");
        PlaySound(sndPlayerHurt);
        PlaySound(voiceline[4]);
        break;
}
