#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Depth
depth = -10;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Free Surface
if (surface_exists(global.waterSurface)) {
    surface_free(global.waterSurface);
    global.waterSurface = noone;
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Free Surface
if (surface_exists(global.waterSurface)) {
    surface_free(global.waterSurface);
    global.waterSurface = noone;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw water
var _vw, _vh, _vx, _vy;
_vw = view_wview[0];
_vh = view_hview[0];
_vx = view_xview[0];
_vy = view_yview[0];

// Only draw if within camera view
if (bbox_right < _vx || bbox_left > _vx + _vw || bbox_bottom < _vy || bbox_top > _vy + _vh) exit;

// 1. Maintain shared view surface captured once per frame
if (surface_exists(global.waterSurface)) {
    if (surface_get_width(global.waterSurface) != _vw || surface_get_height(global.waterSurface) != _vh) {
        surface_free(global.waterSurface);
        global.waterSurface = noone;
    }
}

if (!surface_exists(global.waterSurface)) {
    global.waterSurface = surface_create(_vw, _vh);
    global.waterSurfaceFrame = -1;
}

if (global.waterSurfaceFrame != World.gameTime) {
    global.waterSurfaceFrame = World.gameTime;
    surface_copy(global.waterSurface, 0, 0, application_surface);
}

// 2. Visible view bounds for this water block
var _left, _top, _right, _bottom, _width, _height;
_left = max(x, _vx);
_top = max(y, _vy);
_right = min(x + sprite_width, _vx + _vw);
_bottom = min(y + sprite_height, _vy + _vh);

_width = _right - _left;
_height = _bottom - _top;

if (_width <= 0 || _height <= 0) exit;

var _waveFreq;
_waveFreq = 0.04;

// 3. Draw heat-distorted surface sampled from full viewport
shader_pixel_set(global.shaderHeat);
shader_pixel_uniform_f("u_currenttime", (_top * _waveFreq) + (World.gameTime * 0.004));
shader_pixel_uniform_f("u_strenght", _height * _waveFreq);

draw_surface_part(global.waterSurface, _left - _vx, _top - _vy, _width, _height, floor(_left), floor(_top));

shader_reset();

// 4. Color tint
draw_set_blend_mode(bm_one);
draw_self();
draw_set_blend_mode(bm_normal);
