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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Invincibility

// Apply invincibility
EnemyInvincibility();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw spinner

if (enemyBlinkTimer > 0 && (global.gameTime div 60) mod 3 || enemyBlinkTimer == 0) {
    // Draw enemy
    draw_sprite_ext(sprite_index, image_index, x, y - dsin(global.gameTime div 10)*4, image_xscale, image_yscale, dcos(global.gameTime/8)*12, image_blend, image_alpha);
}

// Draw HP bar
if (enemyHP != noone) {
    draw_healthbar(x, y - 20, x + enemyHPMax * 6, y - 18, (enemyHP / enemyHPMax) * 100, c_dkgray, c_red, c_lime, 0, true, true);
}
