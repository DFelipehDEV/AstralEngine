#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Depth

depth = -10;

surfaceRipple = surface_create(256*image_xscale, 128*image_yscale);
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*preview
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw water

draw_self();
if (!surface_exists(surfaceRipple)) {
    surfaceRipple = surface_create(256*image_xscale, 128*image_yscale);
}
shader_pixel_set(global.shaderHeat);
shader_pixel_uniform_f("u_currenttime", global.roomTick/20);
shader_pixel_uniform_f("u_strenght", 5.0);

var _x, _y;
_x = (x - view_xview[0]) << 0;
_y = (y - view_yview[0]) << 0;
surface_copy(surfaceRipple, 0, 0, application_surface);
draw_surface_part(surfaceRipple, _x, _y, 256*image_xscale, 128*image_yscale, x << 0, y << 0);
shader_reset();
