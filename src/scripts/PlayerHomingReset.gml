/// PlayerHomingReset(action, xSpeed, ySpeed, invincibilityTime, x, y)
 // Resets player from a homing state

if (action == PlayerActionHomingAttack) {
    // Avoid death after homing
    if (invincibilityTime < argument3) {
        invincibilityTime = argument3;
    }
    xSpeed = argument1;
    ySpeed = argument2;
    PlayerSetAction(argument0);

    x = argument4;
    y = argument5;
}
