/// PlayerHomingReset(state, xSpeed, ySpeed, invincibilityTimer, x, y)
 // Resets player from a homing state

if (state == PlayerStateHomingAttack) {
    // Avoid death after homing
    if (invincibilityTimer < argument3) {
        invincibilityTimer = argument3;
    }
    xSpeed = argument1;
    ySpeed = argument2;
    StatesSet(argument0);

    x = argument4;
    y = argument5;
}
