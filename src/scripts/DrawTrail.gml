/// DrawTrail(sprite, trailwidth, automaticalpha)
//note: use draw_set_color, draw_set_alpha to change trail attributes if you want!
//if automatic alhpa is set, trail will fade. If not, make the sprite handle the fading
var _spr, _wid, _autoalpha, _color, _xt, _xt_i, _a, _px, _py, _nx, _ny, i, _size, _dir, _dx, _dy, _trailAlpha, _finalAlpha;
_spr = argument0;
_wid = argument1 * 0.5;
_autoalpha = argument2;
_color = draw_get_color();
_xt = 0
_xt_i = 0.1
texture_set_repeat(true);
_px = ds_list_find_value(trailx, 0);
_py = ds_list_find_value(traily, 0);
draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(argument0,0));
_size = ds_list_size(trailx)
for (i = 0; i < _size; i += 1) {
    _nx = ds_list_find_value(trailx, i)
    _ny = ds_list_find_value(traily, i)
    _dir = point_direction(_px, _py, _nx, _ny);
    _dx = lengthdir_x(_wid, _dir+90);
    _dy = lengthdir_y(_wid, _dir+90);
    _a = draw_get_alpha()
    if (_autoalpha == true) _a = ((i-1)/_size) * draw_get_alpha()

    _trailAlpha = ds_list_find_value(trailal, i);
    _finalAlpha = _a * _trailAlpha;
    _xt = (i-1)/_size
    draw_vertex_texture_color(_px + _dx, _py + _dy, _xt, 0, _color, _finalAlpha);
    draw_vertex_texture_color(_px - _dx, _py - _dy, _xt, 1, _color, _finalAlpha);
    _px = _nx;
    _py = _ny;
    _xt += _xt_i;
}
draw_primitive_end();
