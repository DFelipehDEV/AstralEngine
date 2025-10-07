/// WindowSetScale(scale)
var _scale;
_scale = argument0;

if (_scale >= 3) {
    if (window_get_fullscreen()) {
        _scale = 1;
        window_set_fullscreen(false);
    } else {
        window_set_fullscreen(true);
        window_set_size(ScreenWidth, ScreenHeight);
        window_set_region_size(ScreenWidth, ScreenHeight, 1);
        window_center();
        return _scale;
    }
}

window_set_fullscreen(false);
window_set_size(ScreenWidth * _scale, ScreenHeight * _scale);
window_set_region_size(ScreenWidth, ScreenHeight, 1);

// Wait for the window to resize before centering
repeat (20) {
    if (window_get_width() == ScreenWidth * _scale) break;
}

window_center();

return _scale;
