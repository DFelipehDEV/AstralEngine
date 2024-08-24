/// PlayerSetAction(action)
// Exit state
switch (action) {
    case PlayerActionGrind:
        sound_stop("snd/PlayerGrindContinue");
        break;
    case PlayerActionSlide:
        sound_stop("snd/PlayerSlide");
        break;
    case PlayerActionStomp:
        PlayerSensorPosUpdate();
        break;
}

action = argument0;
actionTimer = 0;

// Enter state
switch (action) {
    case PlayerActionNormal:

        break;

    case PlayerActionSpring:
        AnimationApply("SPRING");
        break;
    case PlayerActionTurn:
        keyRight = false;
        keyLeft = false;
        xSpeed = 0;
        AnimationApply("TURN");
        break;

    case PlayerActionJump:
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

    case PlayerActionAirdash:
        airdashPossible = false;
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

    case PlayerActionRoll:
        AnimationApply("ROLL");
        break;

    case PlayerActionCrouch:
        AnimationApply("CROUCH");
        break;

    case PlayerActionLookup:
        AnimationApply("LOOK_UP");
        break;

    case PlayerActionSpindash:
        spindashStrength = 0;
        break;

    case PlayerActionSkid:
        AnimationApply("SKID");
        break;

    case PlayerActionHomingAttack:
        PlayerAirdashReset();
        AnimationApply("JUMP");
        break;

    case PlayerActionHomingFlight:
        AnimationApply(choose("HOMED_1", "HOMED_2", "SPRING_TRICK_VERTICAL"));
        allowKeysTimer = 20;
        break;
    case PlayerActionWalljump:
        xSpeed = 0;
        AnimationApply("WALLGRAB");
        break;

    case PlayerActionGrind:
        AnimationApply("GRIND_1");
        grind = 0;
        break;

    case PlayerActionSlide:
        slideResetTimer = 35;
        AnimationApply("SLIDE");
        break;

    case PlayerActionStomp:
        AnimationApply("STOMP");
        xSpeed = 0;
        ySpeed = 13;
        trailTimer = 80;
        sensorBottomDistance = 14;
        animationAngle = 0;
        break;

    case PlayerActionStompLand:
        AnimationApply("STOMP_LAND");
        PlayerSensorPosUpdate();
        break;

    case PlayerActionCorkscrew:

        break;

    case PlayerActionLightspeed:
        AnimationApply("SPRING");
        break;

    case PlayerActionTricks:

        break;
    case PlayerActionQTEKeys:

        break;

    case PlayerActionPush:
        AnimationApply("PUSH");
        break;

    case PlayerActionWaylauncher:
        xSpeed = 0;
        ySpeed = 0;
        break;

    case PlayerActionBoostAir:
        boostAirTime = 80;
        boostPossible = true;
        AnimationApply("LAUNCH");
        break;

    case PlayerActionGrab:

        break;

    case PlayerActionTransform:
        AnimationApply("TRANSFORM");
        break;

    case PlayerActionHurt:
        AnimationApply("HURT_FALL");
        break;

    case PlayerActionDead:
        ySpeed = -6;
        ground = false;
        movementAllow = false;
        AnimationApply("DEAD");
        AnimationUpdate();
        PlaySound("snd/PlayerHurt");
        PlaySound(voiceline[4]);
        break;
}
