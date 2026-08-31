#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Depth & Surface
depth = -10;
surfaceRipple = noone;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Free Surface
if (surface_exists(surfaceRipple)) {
    surface_free(surfaceRipple);
    surfaceRipple = noone;
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Free Surface
if (surface_exists(surfaceRipple)) {
    surface_free(surfaceRipple);
    surfaceRipple = noone;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw water
if (surface_exists(surfaceRipple)) {
    if (surface_get_width(surfaceRipple) != sprite_width || surface_get_height(surfaceRipple) != sprite_height) {
        surface_free(surfaceRipple);
        surfaceRipple = noone;
    }
}

if (!surface_exists(surfaceRipple)) {
    surfaceRipple = surface_create(sprite_width, sprite_height);
}

var _xOnScreen, _yOnScreen;
_xOnScreen = floor(x - view_xview[0]);
_yOnScreen = floor(y - view_yview[0]);

surface_copy_part(surfaceRipple, 0, 0, application_surface, _xOnScreen, _yOnScreen, sprite_width, sprite_height);

var _waveFreq;
_waveFreq = 0.04;

shader_pixel_set(global.shaderHeat);
shader_pixel_uniform_f("u_currenttime", (y * _waveFreq) + (World.gameTime * 0.004));
shader_pixel_uniform_f("u_strenght", sprite_height * _waveFreq);

draw_surface(surfaceRipple, floor(x), floor(y));

shader_reset();

draw_set_blend_mode(bm_one);
draw_self();
draw_set_blend_mode(bm_normal);
