#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables and animation speed

event_inherited();
image_speed = 0.5;
knockOnDeath = false;

shockTimer = 0;
shockHazard = noone;
chargeSound = -1;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop sound effects

audio_stop(sndEnemySpinnerShock)
audio_stop(chargeSound)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shock

if (point_in_rectangle(x, y, view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0])) {
    shockTimer += global.timeScale;
    if (shockTimer > 80 && shockTimer < 130 && !audio_isplaying(chargeSound)) {
        chargeSound = PlaySound(sndEnemySpinnerShockCharge);
    }

    if (shockTimer > 130 && shockHazard == noone) {
        shockHazard = instance_create(x, y, objSpinnerShock);
        audio_stop(chargeSound);
        PlaySound(sndEnemySpinnerShock);
    }

    if (shockTimer > 180) {
        instance_destroy_id(shockHazard);
        shockHazard = noone;
        shockTimer = 0;
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
