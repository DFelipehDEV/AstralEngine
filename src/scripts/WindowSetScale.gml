/// WindowSetScale(scale)
var _scale, _full;
_scale = argument0;

if (_scale >= 3) {
    if (window_get_fullscreen() && _scale > 3) {
        _scale = 1;
        _full = false;
    } else {
        _scale = 3;
        _full = true;
    }
} else {
    if (_scale < 1) _scale = 1;
    _full = false;
}

// heavily based on renex's method: https://github.com/omicronrex/renex2-engine/commit/c53aad679f3042a7b21b72514bbbdfd8413a7693
if (_full) {
    window_set_region_scale(0, 1);

    var _s;
    _s = min(display_get_width() / ScreenWidth, display_get_height() / ScreenHeight);
    global.rw = round(ScreenWidth * _s);
    global.rh = round(ScreenHeight * _s);
    global.ww = display_get_width();
    global.wh = display_get_height();
    global.woffset = (global.ww - global.rw) div 2;
    global.hoffset = (global.wh - global.rh) div 2;

    window_set_fullscreen(true);
} else {
    window_set_region_scale(_scale, 1);

    global.rw = ScreenWidth * _scale;
    global.rh = ScreenHeight * _scale;
    global.ww = global.rw;
    global.wh = global.rh;
    global.woffset = 0;
    global.hoffset = 0;

    window_set_fullscreen(false);
    window_set_size(global.ww, global.wh);

    // Wait for the window to resize before centering
    repeat (20) {
        if (window_get_width() == global.ww) break;
    }
}

window_resize_buffer(global.ww, global.wh, 1, 0);
window_center();

return _scale;
