#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
offset = 0;
spd = 0.3;
extended = false;
mask_index = sprNoone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Drill
var _angle, _ext;
_angle = ((World.gameTime * spd + offset) mod 360 + 360) mod 360;
_ext = clamp(dsin(_angle) * 2.5, 0, 1);
y = ystart + (1 - _ext) * 29;

if (_ext > 0) {
    mask_index = sprite_index;
    if (!extended) {
        if (DistanceToView(x, y) == 0) {
            PlaySound(sndSpikeMove, 0.9);
        }
    }
} else {
    mask_index = sprNoone;
}
extended = (_ext > 0);
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//override grid 32,32,0,0
//field offset: number
//field spd: number
/*preview nodrawself
depth = -2;

var _offset, _spd;
_offset = 0;
_spd = 0.3;
if (FieldDefined("offset")) _offset = Field("offset");
if (FieldDefined("spd")) _spd = Field("spd");

var _angle, _ext, _curY;
_angle = ((current_time * _spd + _offset) mod 360 + 360) mod 360;
_ext = clamp(dsin(_angle) * 2.5, 0, 1);
_curY = y + (1 - _ext) * 29;

// Ghost spike
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.25);

// Animated spike
draw_sprite_ext(sprite_index, image_index, x, _curY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
*/
