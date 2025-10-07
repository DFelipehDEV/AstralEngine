/// BodyApplyGravity(gravity)

if (!ground) {
    ySpeed += argument0 * global.timeScale;
    ySpeed = clamp(ySpeed, -14, 14);
}
