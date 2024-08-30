/// PlayerHomingReset(action, xSpeed, ySpeed, invincibilityTimer, x, y)
 // Resets player from a homing state

if (action == PlayerActionHomingAttack) {
    // Avoid death after homing
    if (invincibilityTimer < argument3) {
        invincibilityTimer = argument3;
    }
    xSpeed = argument1;
    ySpeed = argument2;
    PlayerSetAction(argument0);

    x = argument4;
    y = argument5;
}
