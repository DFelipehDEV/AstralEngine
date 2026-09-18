//// DrawBar(x, y, width, height, [fillColor=ColorPrimary], [borderColor=ColorPrimaryLight], [alpha=draw_get_alpha()])
var _x, _y, _w, _h, _fillColor, _borderColor, _alpha;
_x = argument0;
_y = argument1;
_w = argument2;
_h = argument3;

if (_w <= 0 || _h <= 0) exit;
_fillColor = ColorPrimary;
_borderColor = ColorPrimaryLight;
_alpha = draw_get_alpha();

switch (argument_count) {
    case 7:
        _alpha = argument6;
    case 6:
        _borderColor = argument5;
    case 5:
        _fillColor = argument4;
        break;
}

var _prevAlpha;
_prevAlpha = draw_get_alpha();
draw_set_alpha(_alpha);

// Top
draw_line_color(_x, _y, _x + _w, _y, _borderColor, _borderColor);

// Fill
if (_h > 2) {
    draw_rect(_x, _y + 1, _w, _h - 2, _fillColor, _alpha);
}

// Bottom
if (_h > 1) {
    draw_line_color(_x, _y + _h - 1, _x + _w, _y + _h - 1, _borderColor, _borderColor);
}

draw_set_alpha(_prevAlpha);
