#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables and animation speed

event_inherited();
knockOnDeath = false;  // Check if the enemy "busts" or not

image_speed= 0.5;    // Animation speed

shockTimer = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop sound effects

audio_stop(sndEnemySpinnerShock)
audio_stop(sndEnemySpinnerShockCharge)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shock

if (point_in_rectangle(x, y, view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0])) {
    shockTimer += 1;
    if (shockTimer == 70) {
        PlaySound(sndEnemySpinnerShockCharge)
    }


    if (shockTimer == 120) {
        audio_stop(sndEnemySpinnerShockCharge)
        PlaySound(sndEnemySpinnerShock)
        shockTimer = 0
        instance_create_depth(x, y, -1, objSpinnerShock);
        y = ystart;
    }


    if (shockTimer == 35 && audio_isplaying(sndEnemySpinnerShock)) {
        audio_stop(sndEnemySpinnerShock)
    }
}
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
