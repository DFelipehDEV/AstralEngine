/// PlayerSetState(state)
// Exit state
switch (state) {
    case PlayerStateGrind:
        audio_stop(sndPlayerGrind);
        break;
    case PlayerStateSlide:
        audio_stop(sndPlayerSlide);
        break;
    case PlayerStateStomp:
        PlayerSensorPosUpdate();
        break;
}

state = argument0;
stateTimer = 0;

// Enter state
switch (state) {
    case PlayerStateNormal:

        break;

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
        if (ground) {
            ySpeed = angleCos*(jumpStrength/2) - angleSin * xSpeed/1.8;
            xSpeed = angleCos*xSpeed + angleSin*jumpStrength;
            PlayerSetAngle(0);
        }
        PlayerAirdashReset();
        AnimationApply("JUMP");
        ground = false;
        jumpAirTimer = 0;
        break;

    case PlayerStateAirdash:
        canAirdash = false;
        AnimationApply("JUMP");
        if (keyLeft) {
            xSpeed = -11;
        } else if (keyRight) {
            xSpeed = 11;
        } else {
            xSpeed = 11 * xDirection;
        }
        ySpeed = 0;
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
        PlayerAirdashReset();
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
        slideResetTimer = 35;
        AnimationApply("SLIDE");
        break;

    case PlayerStateStomp:
        AnimationApply("STOMP");
        xSpeed = 0;
        ySpeed = 13;
        trailTimer = 80;
        sensorBottomDistance = 14;
        image_angle = 0;
        break;

    case PlayerStateStompLand:
        AnimationApply("STOMP_LAND");
        PlayerSensorPosUpdate();
        break;

    case PlayerStateCorkscrew:

        break;

    case PlayerStateLightspeed:
        AnimationApply("SPRING");
        break;

    case PlayerStateTricks:

        break;
    case PlayerStateQTEKeys:

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

    case PlayerStateGrab:

        break;

    case PlayerStateTransform:
        AnimationApply("TRANSFORM");
        break;

    case PlayerStateHurt:
        AnimationApply("HURT_FALL");
        break;

    case PlayerStateDead:
        ySpeed = -6;
        ground = false;
        canMove = false;
        AnimationApply("DEAD");
        AnimationUpdate();
        PlaySound(sndPlayerHurt);
        PlaySound(voiceline[4]);
        break;
}
