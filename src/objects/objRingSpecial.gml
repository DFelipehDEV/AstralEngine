#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init
event_inherited();
value = 50;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
if (collected) {
    with(instance_create(x, y, objRingCollected)) {
        sparkleOffset = 30;
    }
    PlaySoundSingle(sndRingSpecial);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
image_index = global.gameTime div 40;

image_angle = global.gameTime / 8.3;
image_xscale = max(lerp(image_xscale, 1 - floorto(abs(objPlayer.x - x)/200, 0.1), 0.2), 0);
image_yscale = image_xscale;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
var _pulse;
_pulse = abs(sin(current_time / 1300)) * 0.1;
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprLightPoint, 0, x, y, image_xscale * 0.5 + _pulse, image_yscale * 0.5 + _pulse, 0, $37C1CE, image_alpha * 0.5);
draw_set_blend_mode(bm_normal);
draw_self();
