/// PlayerStateSkid()

// Decelerate while going to the left
if (xSpeed < 0) {
    xSpeed += skidDeceleration;

    // Back to the normal state if the player stopped or is not in the ground anymore or is not holding the key anymore
    if (xSpeed >= 0 || !keyRight || !ground) {
        PlayerSetState(PlayerStateNormal);
    }
}
// Decelerate while going to the right
else
if (xSpeed > 0) {
    xSpeed -= skidDeceleration;

    // Back to the normal state if the player stopped or is not in the ground anymore or is not holding the key anymore
    if (xSpeed <= 0 || !keyLeft || !ground) {
        PlayerSetState(PlayerStateNormal);
    }
}

// Stop if the speed is 0
if (xSpeed == 0) {
    PlayerSetState(PlayerStateNormal);
}

// Create dust effect
if (alarm[0] == -1) {
    alarm[0] = 3;
}

xDirection = esign(xSpeed, xDirection);

if (ground)
    PlayerJump();
