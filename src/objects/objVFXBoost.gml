#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation alpha, animation angle and sounds

image_alpha = 0.1; // Animation alpha

// Play boost sounds
PlaySound("sndPlayerBoostContinue");
PlaySoundExt("sndPlayerBoostLoop", global.volumeSounds, 1, true)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop the sounds

sound_stop("sndPlayerBoostLoop");
sound_stop("sndPlayerBoostContinue");
ownerID.boostInstance = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation alpha, animation angle and position

if (!instance_exists(ownerID)){ instance_destroy(); exit; }

if (image_alpha <= 0) {
    instance_destroy();
}

// Increase alpha if the player started to boost
if (image_alpha < 0.8 && ownerID.boosting) {
    image_alpha += 0.05;
}

// Fade when not boosting
if (!ownerID.boosting || abs(ownerID.xSpeed) < 2.2) {
    image_alpha -= 0.05;
}

x = ownerID.x;
y = ownerID.y;

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
if (ownerID.xDirection == 1) {
    draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else {
    draw_sprite_ext(sprite_index, image_index, floor(x) + 11*dsin(image_angle), floor(y + 11*dcos(image_angle)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
draw_set_blend_mode(bm_normal);
