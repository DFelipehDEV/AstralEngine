#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
event_inherited();
image_speed = 0.5;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw spinner
if (invincibilityTimer > 0 && (sysTime.gameTime div 60) mod 3 || invincibilityTimer == 0) {
    // Draw enemy
    draw_sprite_ext(sprite_index, image_index, x, y - dsin(sysTime.gameTime div 10)*4, image_xscale, image_yscale, dcos(sysTime.gameTime/8)*12, image_blend, image_alpha);
}

event_user(0);
