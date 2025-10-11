#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw NPC
draw_sprite_ext(sprite_index, 2, x, y, max(0.6, abs(cos(global.gameTime/230)*1.4)), max(0.3, abs(cos(global.gameTime/200)*1.3)), image_angle, image_blend, image_alpha)
draw_sprite_ext(sprite_index, 1, x - 1, y, image_xscale, image_yscale, round((global.gameTime/8)/6)*6, image_blend, image_alpha);

event_user(0);
