/// BodyApplyGravity(gravity)

if (!ground) {
    ySpeed += argument0 * sysTime.timeScale;
    ySpeed = clamp(ySpeed, -14, 14);
}
