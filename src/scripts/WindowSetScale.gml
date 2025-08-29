/// WindowSetScale(scale)

var _scale;
_scale = argument0;

// Set to the minimum size if the window is too big
if (_scale >= 3 && window_get_fullscreen()) {
    _scale = 1;
    window_set_fullscreen(false);
}

window_set_size(ScreenWidth * _scale, ScreenHeight * _scale);
window_set_region_size(ScreenWidth, ScreenHeight, 1);

// Fullscreen
if (_scale == 3) {
    window_set_size(ScreenWidth, ScreenHeight);
    window_set_fullscreen(true);
} else {
    // Wait for the window to resize before centering
    repeat (20) {
        if (window_get_width() == ScreenWidth * _scale) break;
    }

    window_center();
}

return _scale;
