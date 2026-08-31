/// SonicAnimations()
switch(animation) {
    case "WALLGRAB":
        AnimationSet(sprSonicWallJump, 0.2);
        break;

    case "PUSH":
        AnimationSet(sprSonicPush, 0.15, 1);
        break;

    case "IDLE":
        AnimationSet(sprSonicIdle, 0.17);
        break;

    case "IDLE_WAIT":
        AnimationSet(sprSonicIdleWait, 0.2, 3, 14, "IDLE_WAIT_2");
        break;

    case "IDLE_WAIT_2":
        AnimationSet(sprSonicIdleWait2, 0.16, 1, 2, "IDLE");
        break;

    case "LOOK_UP":
        AnimationSet(sprSonicLookUp, 0.145, 2);
        break;

    case "CROUCH":
        AnimationSet(sprSonicCrouch, 0.3, 0, 0);
        break;

    case "TURN":
        AnimationSet(sprSonicTurn, 0.25, 0, 0);
        break;

    case "SPINDASH":
        AnimationSet(sprSonicSpindash, 0.3);
        break;

    case "SPINDASH_CHARGE":
        AnimationSet(sprSonicSpindashCharge, 0.4);
        break;

    case "WALK":
        AnimationSet(sprSonicWalk1, 0.13);
        break;

    case "WALK_2":
        AnimationSet(sprSonicWalk2, 0.13);
        break;

    case "JOG":
        AnimationSet(sprSonicJog1, 0.13);
        break;

    case "JOG_2":
        AnimationSet(sprSonicJog2, 0.13);
        break;

    case "RUN":
        AnimationSet(sprSonicRun, 0.13);
        break;

    case "JUMP":
        AnimationSet(sprSonicJump);
        break;

    case "ROLL":
        AnimationSet(sprSonicRoll);
        break;

    case "BREATHE":
        AnimationSet(sprSonicBreathe, 0.12, 0, 0);
        break;

    case "SKID":
        AnimationSet(sprSonicSkid, 0.35, 3);
        break;

    case "SLIDE":
        AnimationSet(sprSonicSlide, 0.3, 1);
        break;

    case "GRIND":
        AnimationSet(sprSonicGrind, 0.3);
        break;

    case "GRIND_2":
        AnimationSet(sprSonicGrind2, 0.3, 1);
        break;

    case "STOMP":
        AnimationSet(sprSonicStomp, 0.3);
        break;

    case "STOMP_LAND":
        AnimationSet(sprSonicStompLand, 0.2, 0, 0);
        break;

    case "TRANSFORM":
        AnimationSet(sprSonicTransform, 0.25, 6, 2);
        break;

    case "SPRING":
        AnimationSet(sprSonicSpring, 0.2, 1);
        break;

    case "LANDING":
        AnimationSet(sprSonicLanding, 0.28, 1);
        break;

    case "FALL":
        AnimationSet(sprSonicFall, 0.3, 2);
        break;

    case "HOMED":
        AnimationSet(sprSonicHomed1, 0.5, 0, 0, "FALL");
        break;

    case "HOMED_2":
        AnimationSet(sprSonicHomed2, 0.45, 0, 0, "FALL");
        break;

    case "HANG":
        AnimationSet(sprSonicGrab1, 0.3);
        break;

    case "HANG_2":
        AnimationSet(sprSonicGrab2, 0.2);
        break;

    case "HANG_3":
        AnimationSet(sprSonicGrab3, 0.2);
        break;

    case "TRICK_HOR":
        AnimationSet(sprSonicTrickHor, 0.77, 3, 4, "FALL");
        break;

    case "TRICK_VER":
        AnimationSet(sprSonicTrickVer, 0.35, 9);
        break;

    case "LAUNCH":
        AnimationSet(sprSonicLaunch, 0.49, 1);
        break;

    case "CORKSCREW":
        AnimationSet(sprSonicCorkscrew, 0.37);
        break;

    case "FLING":
        AnimationSet(sprSonicCorkscrew, 0.37, 0, 0, "LAND");
        break;

    case "HURT_FALL":
        AnimationSet(sprSonicHurtFall, 0.2, 0, 0);
        break;

    case "DEAD":
        AnimationSet(sprSonicDie, 0.26, 3);
        break;

    case "LEDGE":
        AnimationSet(sprSonicLedge1, 0.2, 1);
        break;

    case "LEDGE_2":
        AnimationSet(sprSonicLedge2, 0.23, 1);
        break;
}
