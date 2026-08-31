#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
count = 0;
scale = 0;
destroy = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
if (!destroy) {
    scale = lerp(scale, 1, 0.2);
} else {
    scale = lerp(scale, 0, 0.2);
    if (scale < 0.05) {
        instance_destroy();
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Arena HUD
if (!GameStateGet(GameStatePaused) && scale > 0.01) {
    BeginUI();
    // Enemy text
    draw_sprite_ext(sprHUDEnemiesText, 0, ScreenWidthHalf, 16, 1, scale, 0, c_white, 1);
    // Enemies left counter
    draw_sprite_ext(sprHUDEnemiesCounter, count, ScreenWidthHalf, 30, scale, scale, 0, c_white, 1);
    EndUI();
}
