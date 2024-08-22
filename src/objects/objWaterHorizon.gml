#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw

var _width;
_width = 256 * image_xscale;
_y = (y - 2) + sin(global.roomTick*0.03)*1.5
draw_set_blend_mode(bm_add)
DrawTiledTexturePos(x, _y, x + _width, _y, x, _y + 15, x + _width, _y + 15, sprite_index, global.roomTick*0.15, 1, 0, c_white, 1)
draw_set_blend_mode(bm_normal)
