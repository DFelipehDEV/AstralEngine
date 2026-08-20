#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
action = "";
alpha[0] = 0;
alpha[1] = 1;
image_xscale = 4;
image_yscale = image_xscale;

pulseScale = 1;
pulseAlpha = 1;
pulseCooldown = 0;

destroy = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
if (!destroy) {
    alpha[0] = min(alpha[0] + 0.2, 1);
    alpha[1] = lerp(alpha[1], 0, 0.2);
    image_xscale = lerp(image_xscale, 2, 0.2);
    pulseCooldown = max(pulseCooldown - global.timeScale, 0);
    if (pulseCooldown == 0) {
        pulseScale += 0.05 * global.timeScale;
        pulseAlpha -= 0.05 * global.timeScale;
    }

    if (pulseAlpha <= 0) {
        pulseCooldown = 45;
        pulseScale = 1;
        pulseAlpha = 1;
    }
} else {
    alpha[0] = max(alpha[0] - 0.2, 0);
    image_xscale = lerp(image_xscale, 0, 0.2);
    if (alpha[0] == 0) {
        instance_destroy();
    }
}

image_yscale = image_xscale;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
BeginUI();
if (alpha[0] > 0) {
    if (pulseCooldown == 0) {
        d3d_set_fog(1, c_white, 0, 0);
        InputIconDraw(action, ScreenWidthHalf, 64, image_xscale * pulseScale, image_yscale * pulseScale, image_angle, image_blend, pulseAlpha);
        d3d_set_fog(0, c_white, 0, 0);
    }
    InputIconDraw(action, ScreenWidthHalf, 64, image_xscale, image_yscale, image_angle, image_blend, alpha[0]);

    // Highlight
    if (alpha[1] > 0) {
        d3d_set_fog(1, c_white, 0, 0);
        InputIconDraw(action, ScreenWidthHalf, 64, image_xscale, image_yscale, image_angle, image_blend, alpha[1]);
        d3d_set_fog(0, c_white, 0, 0);
    }
}
EndUI();
