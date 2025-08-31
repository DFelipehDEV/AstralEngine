#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables and animation speed

action_inherited();     // Get parent's variables

// Animation speed
image_speed = 0.5;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw spinner

if (invincibilityTimer > 0 && (global.gameTime div 60) mod 3 || invincibilityTimer == 0) {
    // Draw enemy
    draw_sprite_ext(sprite_index, image_index, x, y - dsin(global.gameTime div 10)*4, image_xscale, image_yscale, dcos(global.gameTime/8)*12, image_blend, image_alpha);
}

event_user(0);
