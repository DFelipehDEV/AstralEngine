//// DrawSlider(x, y, width, height, value, [fillColor=ColorPrimary], [bgColor=c_black])
var _x, _y, _w, _h, _val, _color, _fillColor, _bgColor;
_x = argument0;
_y = argument1;
_w = argument2;
_h = argument3;
_val = argument4;
_fillColor = ColorPrimary;
_bgColor = c_black;

switch (argument_count) {
    case 7:
        _bgColor = argument6;
    case 6:
        _fillColor = argument5;
        break;
}

var _sy, _baseAlpha, _thumbX;
_sy = round(_y - (_h / 2));
_baseAlpha = draw_get_alpha();

// Slider Background
draw_set_alpha(_baseAlpha * 0.3);
draw_set_color(_bgColor);
draw_rectangle(_x, _sy, _x + _w, _sy + _h, false);

// Slider Fill
draw_set_alpha(_baseAlpha);
draw_set_color(_fillColor);
draw_rectangle(_x, _sy, _x + (_w * _val), _sy + _h, false);

// Thumb indicator
_thumbX = round(_x + (_w * _val));
draw_set_color(c_white);
draw_rectangle(_thumbX - 2, _sy - 2, _thumbX + 2, _sy + _h + 2, false);
