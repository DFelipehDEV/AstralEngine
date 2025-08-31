#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation alpha, animation angle and sounds

image_alpha = 0.1; // Animation alpha

// Play boost sounds
PlaySound(sndPlayerBoostContinue);
PlaySoundExt(sndPlayerBoostLoop, global.soundVolume, 1, true)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop the sounds

audio_stop(sndPlayerBoostLoop);
audio_stop(sndPlayerBoostContinue);
player.boostAura = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation alpha, animation angle and position

if (!instance_exists(player)){ instance_destroy(); exit; }

if (image_alpha <= 0) {
    instance_destroy();
}

// Increase alpha if the player started to boost
if (image_alpha < 0.8 && player.boosting) {
    image_alpha += 0.05;
}

// Fade when not boosting
if (!player.boosting || abs(player.xSpeed) < 2.2) {
    image_alpha -= 0.05;
}

x = player.x;
y = player.y;

// Point to direction that is going
image_angle = point_direction(xprevious, yprevious, x, y);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw boost

draw_set_blend_mode(bm_add);
if (player.xDirection == 1) {
    draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else {
    draw_sprite_ext(sprite_index, image_index, floor(x) + 11*dsin(image_angle), floor(y + 11*dcos(image_angle)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
draw_set_blend_mode(bm_normal);
