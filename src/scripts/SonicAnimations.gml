/// SonicAnimations()
switch(animation) {
    case "WALLGRAB":
        AnimationSet(sprSonicWallJump, 0, 0.2);
        break;

    case "PUSH":
        AnimationSet(sprSonicPush, 0, 0.15);
        break;

    case "IDLE":
        AnimationSet(sprSonicIdle, 0, 0.17);
        break;

    case "IDLE_WAIT":
        AnimationSet(sprSonicIdleWait, 3, 0.2, true, 14, "IDLE_WAIT_2");
        break;

    case "IDLE_WAIT_2":
        AnimationSet(sprSonicIdleWait2, 1, 0.16, true, 2, "IDLE");
        break;

    case "LOOK_UP":
        AnimationSet(sprSonicLookUp, 2, 0.145);
        break;

    case "CROUCH":
        AnimationSet(sprSonicCrouch, 0, 0.3, true, 0);
        break;

    case "TURN":
        AnimationSet(sprSonicTurn, 0, 0.25, true, 0);
        break;

    case "SPINDASH":
        AnimationSet(sprSonicSpindash, 0, 0.3);
        break;

    case "SPINDASH_CHARGE":
        AnimationSet(sprSonicSpindashCharge, 0, 0.4);
        break;

    case "WALK":
        AnimationSet(sprSonicWalk1, 0, 0.13, false);
        break;

    case "WALK_2":
        AnimationSet(sprSonicWalk2, 0, 0.13, false);
        break;

    case "JOG":
        AnimationSet(sprSonicJog1, 0, 0.13, false);
        break;

    case "JOG_2":
        AnimationSet(sprSonicJog2, 0, 0.13, false);
        break;

    case "RUN":
        AnimationSet(sprSonicRun, 0, 0.13, false);
        break;

    case "JUMP":
        AnimationSet(sprSonicJump);
        break;

    case "ROLL":
        AnimationSet(sprSonicRoll);
        break;

    case "BREATHE":
        AnimationSet(sprSonicBreathe, 0, 0.12, true, 0);
        break;

    case "SKID":
        AnimationSet(sprSonicSkid, 3, 0.35);
        break;

    case "SLIDE":
        AnimationSet(sprSonicSlide, 1, 0.3);
        break;

    case "GRIND":
        AnimationSet(sprSonicGrind, 0, 0.3);
        break;

    case "GRIND_2":
        AnimationSet(sprSonicGrind2, 1, 0.3);
        break;

    case "STOMP":
        AnimationSet(sprSonicStomp, 0, 0.3);
        break;

    case "STOMP_LAND":
        AnimationSet(sprSonicStompLand, 0, 0.2, true, 0);
        break;

    case "TRANSFORM":
        AnimationSet(sprSonicTransform, 6, 0.25, true, 2);
        break;

    case "SPRING":
        AnimationSet(sprSonicSpring, 1, 0.2);
        break;

    case "LANDING":
        AnimationSet(sprSonicLanding, 1, 0.28);
        break;

    case "FALL":
        AnimationSet(sprSonicFall, 2, 0.3);
        break;

    case "HOMED":
        AnimationSet(sprSonicHomed1, 0, 0.5, true, 0, "FALL");
        break;

    case "HOMED_2":
        AnimationSet(sprSonicHomed2, 0, 0.45, true, 0, "FALL");
        break;

    case "HANG":
        AnimationSet(sprSonicGrab1, 0, 0.3);
        break;

    case "HANG_2":
        AnimationSet(sprSonicGrab2, 0, 0.2);
        break;

    case "HANG_3":
        AnimationSet(sprSonicGrab3, 0, 0.2);
        break;

    case "SPRING_TRICK_HORIZONTAL":
        AnimationSet(sprSonicTrickHor, 3, 0.77, true, 4, "FALL");
        break;

    case "SPRING_TRICK_VERTICAL":
        AnimationSet(sprSonicTrickVer, 9, 0.35);
        break;

    case "LAUNCH":
        AnimationSet(sprSonicLaunch, 1, 0.49);
        break;

    case "CORKSCREW":
        AnimationSet(sprSonicCorkscrew, 0, 0.37);
        break;

    case "FLING":
        AnimationSet(sprSonicCorkscrew, 0, 0.37, true, 0, "LAND");
        break;

    case "HURT_FALL":
        AnimationSet(sprSonicHurtFall, 0, 0.2, true, 0);
        break;

    case "DEAD":
        AnimationSet(sprSonicDie, 3, 0.26);
        break;

    case "LEDGE":
        AnimationSet(sprSonicLedge1, 1, 0.2);
        break;

    case "LEDGE_2":
        AnimationSet(sprSonicLedge2, 1, 0.23);
        break;
}
