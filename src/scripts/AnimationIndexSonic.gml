/// AnimationIndexSonic()
// Sonic animations

switch(animation) {
    case "WALLGRAB":
        AnimationSet(sprSonicWallJump, 0, -1, -1, 0.2, 1, 1, -1, "");
        break;

    case "PUSH":
        AnimationSet(sprSonicPush, 0, -1, 1, 0.15, 1, 1, -1, "");
        break;

    case "IDLE":
        AnimationSet(sprSonicIdle, 0, -1, -1, 0.17, 1, 1, -1, "");
        break;

    case "IDLE_WAIT":
        AnimationSet(sprSonicIdleWait, 0, -1, 3, 0.2, 1, 1, 14, "IDLE_WAIT_2");
        break;

    case "IDLE_WAIT_2":
        AnimationSet(sprSonicIdleWait2, 0, -1, 1, 0.16, 1, 1, 2, "IDLE");
        break;

    case "LOOK_UP":
        AnimationSet(sprSonicLookUp, 0, -1, 2, 0.145, 1, 1, -1, "");
        break;

    case "CROUCH":
        AnimationSet(sprSonicCrouch, 0, -1, -1, 0.4, 1, 0, -1, "");
        break;

    case "TURN":
        AnimationSet(sprSonicTurn, 0, -1, 1, 0.25, 1, 0, 0, "");
        break;

    case "SPINDASH":
        AnimationSet(sprSonicSpindash, 0, -1, -1, 0.3, 1, 1, -1, "");
        break;

    case "SPINDASH_CHARGE":
        AnimationSet(sprSonicSpindashCharge, 0, -1, -1, 0.4, 1, 1, -1, "");
        break;

    case "WALK":
        AnimationSet(sprSonicWalk1, 0, -1, -1, 0.13, 0, 1, -1, "");
        break;

    case "WALK_2":
        AnimationSet(sprSonicWalk2, 0, -1, -1, 0.13, 0, 1, -1, "");
        break;

    case "JOG":
        AnimationSet(sprSonicJog1, 0, -1, -1, 0.13, 0, 1, -1, "");
        break;

    case "JOG_2":
        AnimationSet(sprSonicJog2, 0, -1, -1, 0.13, 0, 1, -1, "");
        break;

    case "RUN":
        AnimationSet(sprSonicRun, 0, -1, -1, 0.13, 0, 1, -1, "");
        break;

    case "JUMP":
        AnimationSet(sprSonicJump, 0, -1, -1, 0, 1, 1, -1, "");
        break;

    case "ROLL":
        AnimationSet(sprSonicRoll, 0, -1, -1, 0, 1, 1, -1, "");
        break;

    case "BREATHE":
        AnimationSet(sprSonicBreathe, 0, -1, -1, 0.12, 1, 0, -1, "");
        break;

    case "SKID":
        AnimationSet(sprSonicSkid, 0, -1, 3, 0.35, 1, 1, -1, "");
        break;

    case "SLIDE":
        AnimationSet(sprSonicSlide, 0, -1, 1, 0.3, 1, 1, -1, "");
        break;

    case "GRIND":
        AnimationSet(sprSonicGrind, 0, -1, -1, 0.3, 1, 1, -1, "");
        break;

    case "GRIND_2":
        AnimationSet(sprSonicGrind2, 0, -1, 1, 0.3, 1, 1, -1, "");
        break;

    case "STOMP":
        AnimationSet(sprSonicStomp, 0, -1, 0, 0.3, 1, 1, -1, "");
        break;

    case "STOMP_LAND":
        AnimationSet(sprSonicStompLand, 0, -1, -1, 0.2, 1, 0, -1, "");
        break;

    case "TRANSFORM":
        AnimationSet(sprSonicTransform, 0, -1, 6, 0.25, 1, 1, 2, "");
        break;

    case "SPRING":
        AnimationSet(sprSonicSpring, 0, -1, 1, 0.2, 1, 1, -1, "");
        break;

    case "LANDING":
        AnimationSet(sprSonicLanding, 0, -1, 1, 0.28, 1, 1, -1, "");
        break;

    case "FALL":
        AnimationSet(sprSonicFall, 0, -1, 2, 0.3, 1, 1, -1, "");
        break;

    case "HOMED":
        AnimationSet(sprSonicHomed1, 0, -1, -1, 0.5, 1, 0, 0, "FALL");
        break;

    case "HOMED_2":
        AnimationSet(sprSonicHomed2, 0, -1, -1, 0.45, 1, 0, 0, "FALL");
        break;

    case "HANG":
        AnimationSet(sprSonicGrab1, 0, -1, -1, 0.3, 1, 1, -1, "");
        break;

    case "HANG_2":
        AnimationSet(sprSonicGrab2, 0, -1, -1, 0.2, 1, 1, -1, "");
        break;

    case "HANG_3":
        AnimationSet(sprSonicGrab3, 0, -1, -1, 0.2, 1, 1, -1, "");
        break;

    case "SPRING_TRICK_HORIZONTAL":
        AnimationSet(sprSonicTrickHor, 0, -1, 3, 0.77, 1, 1, 4, "FALL");
        break;

    case "SPRING_TRICK_VERTICAL":
        AnimationSet(sprSonicTrickVer, 0, -1, 9, 0.35, 1, 1, -1, "");
        break;

    case "LAUNCH":
        AnimationSet(sprSonicLaunch, -1, -1, 1, 0.49, 1, 1, -1, "");
        break;

    case "CORKSCREW":
        AnimationSet(sprSonicCorkscrew, 0, -1, 0, 0.37, 1, 1, -1, "");
        break;

    case "FLING":
        AnimationSet(sprSonicCorkscrew, 0, -1, -1, 0.37, 1, 0, 0, "LAND");
        break;

    case "HURT_FALL":
        AnimationSet(sprSonicHurtFall, 0, -1, -1, 0.2, 1, 0, -1, "");
        break;

    case "DEAD":
        AnimationSet(sprSonicDie, 0, -1, 3, 0.26, 1, 1, -1, "");
        break;

    case "LEDGE":
        AnimationSet(sprSonicLedge1, 0, -1, 1, 0.2, 1, 1, -1, "");
        break;

    case "LEDGE_2":
        AnimationSet(sprSonicLedge2, 0, -1, 1, 0.23, 1, 1, -1, "");
        break;
}
