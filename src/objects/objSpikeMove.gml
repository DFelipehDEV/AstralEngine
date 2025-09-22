#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

_yStart = y + 29;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Drill

if (floor(abs(y - _yStart)) == 21) {
    PlaySound(sndSpikeMove, 0.9);
}
y = lerp(y, _yStart - round(((global.roomTick/6) mod 26)/29)*29, 0.5);
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Preview
/*preview
depth = -2;
draw_sprite_ext(sprite_index, image_index, x, y + 29, image_xscale, image_yscale, image_angle, c_red, image_alpha)
*/
