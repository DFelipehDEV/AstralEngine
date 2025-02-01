/// PlayerAnimationNormal()
if (ground) {
    // Idle animation
    if (xSpeed == 0) {
        switch (edgeCollision) {
            case false:
                // Check if we are in the edge of a solid
                if (PlayerCollisionLeftEdge(x, y, angle) && !PlayerCollisionRightEdge(x, y, angle)) {
                    if (animation != "LEDGE" && animation != "LEDGE_2") {
                        PlayVoice(choose(voiceline[11], voiceline[12], sndNoone));
                    }
                    switch (xDirection) {
                        case 1:
                            AnimationApply("LEDGE");
                            break;

                        case -1:
                            AnimationApply("LEDGE_2");
                            break;
                    }
                }
                else if (!PlayerCollisionLeftEdge(x, y, angle) && PlayerCollisionRightEdge(x, y, angle)) {
                    if (animation != "LEDGE" && animation != "LEDGE_2") {
                        PlayVoice(choose(voiceline[11], voiceline[12]));
                    }
                    switch (xDirection) {
                        case 1:
                            AnimationApply("LEDGE_2");
                            break;

                        case -1:
                            AnimationApply("LEDGE");
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

    // Moving animations
    if (abs(xSpeed) > 0) {
        if (abs(xSpeed) < 2) {
            AnimationApply("WALK");
        } else if (abs(xSpeed) < 2.7) {
            AnimationApply("WALK_2");
        } else if (abs(xSpeed) < 4) {
            AnimationApply("JOG");
        } else if (abs(xSpeed) < 9.7) {
            AnimationApply("JOG_2");
        } else {
            AnimationApply("RUN");
        }
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
