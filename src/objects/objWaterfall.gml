#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
draw_set_blend_mode(bm_add);
DrawSpriteQuad(x, y, x + sprite_width, y, x, y + sprite_height, x + sprite_width, y + sprite_height, sprite_index,
                global.gameTime * 0.03, 1, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_normal);
