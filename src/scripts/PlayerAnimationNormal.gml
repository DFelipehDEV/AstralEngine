/// PlayerAnimationNormal()
if (ground) {
    // Idle animation
    if (xSpeed == 0) {
        switch (edgeCollision) {
            case false:
                // Check if we are in the edge of a solid
                if (PlayerCollisionLeftEdge(x, y, angle) && !PlayerCollisionRightEdge(x, y, angle)) {
                    if (animation != "LEDGE_1" && animation != "LEDGE_2") {
                        PlayVoice(choose(voiceline[11], voiceline[12], "snd/noone"));
                    }
                    switch (xDirection) {
                        case 1:
                            AnimationApply("LEDGE_1");
                            break;

                        case -1:
                            AnimationApply("LEDGE_2");
                            break;
                    }
                }
                else if (!PlayerCollisionLeftEdge(x, y, angle) && PlayerCollisionRightEdge(x, y, angle)) {
                    if (animation != "LEDGE_1" && animation != "LEDGE_2") {
                        PlayVoice(choose(voiceline[11], voiceline[12]));
                    }
                    switch (xDirection) {
                        case 1:
                            AnimationApply("LEDGE_2");
                            break;

                        case -1:
                            AnimationApply("LEDGE_1");
                            break;
                    }
                }
            break;

            case true:
                // Check if its not been waiting for a long time
                if (animation != "IDLE_WAIT" && animation != "IDLE_WAIT_2") {
                    // Idle animation
                    AnimationApply("IDLE");

                    if (animationTime == 300) {
                        AnimationApply(choose("IDLE_WAIT", "IDLE_WAIT_2"));
                    }
                }
            break;
        }
    }

    // Walk animation
    if abs(xSpeed) > 0 && abs(xSpeed) < 2.4 {
        AnimationApply("WALK_1");
    }

    // Walk 2 animation
    if (abs(xSpeed) >= 2.4 && abs(xSpeed) < 4) {
        AnimationApply("WALK_2");
    }

    // Jog animation
    if (abs(xSpeed) >= 4 && abs(xSpeed) < 6.1) {
        AnimationApply("JOG_1");
    }

    // Jog 2 animation
    if (abs(xSpeed) >= 6.1 && abs(xSpeed) < 10) {
        AnimationApply("JOG_2");
    }

    // Run animation
    if (abs(xSpeed) >= 10) {
        AnimationApply("RUN");
    }
}
else {
    if (animation != "SPRING_TRICK_VERTICAL" && animation != "FALL" && animation != "LAUNCH" && animation != "FLING") {
        // Fall animation
        if (abs(ySpeed) >= 0.2) {
            AnimationApply("LANDING");
        }
    }
}
