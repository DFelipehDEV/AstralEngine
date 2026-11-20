#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
useSprite = false;
background = -1;

tileHorizontal = false;
tileVertical = false;

xSpeed = 0;
ySpeed = 0;

xSeperation = 0;
ySeperation = 0;

xMotionScale = 1;
yMotionScale = 1;

xScroll = 0;
yScroll = 0;

rawWidth = 0;
rawHeight = 0;
tileWidth = 0;
tileHeight = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move
if (tileWidth <= 0 && (background != -1 || sprite_index != -1)) {
    event_perform(ev_other, ev_room_start);
}

// Wrap texture
if (tileWidth > 0) {
    xScroll = xScroll mod tileWidth;
}
if (tileHeight > 0) {
    yScroll = yScroll mod tileHeight;
}

xScroll += xSpeed;
yScroll += ySpeed;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field useSprite: bool
//field background: background
//field sprite_index: sprite
//field image_speed: number
//field tileHorizontal: bool
//field tileVertical: bool
//field xMotionScale: number
//field yMotionScale: number
//field xSeperation: number
//field ySeperation: number
//field xSpeed: number
//field ySpeed: number

/*preview nodrawself
var _useSpr;
_useSpr = false;
if (FieldDefined("useSprite")) _useSpr = Field("useSprite");

var _resName, _handle, _w, _h;
_resName = "";
_handle = -1;
_w = 0;
_h = 0;

if (_useSpr) {
    if (FieldDefined("sprite_index")) _resName = string(Field("sprite_index"));
    if (_resName != "") {
        _handle = Sprite(_resName, 0);
        if (_handle != -1) {
            _w = sprite_get_width(_handle);
            _h = sprite_get_height(_handle);
        }
    }
} else {
    if (FieldDefined("background")) _resName = string(Field("background"));
    if (_resName != "") {
        _handle = Background(_resName);
        if (_handle != -1) {
            _w = background_get_width(_handle);
            _h = background_get_height(_handle);
        }
    }
}

if (_handle != -1 && _w > 0 && _h > 0) {
    var _tileH, _tileV, _xSep, _ySep;
    _tileH = false;
    _tileV = false;
    _xSep = 0;
    _ySep = 0;

    if (FieldDefined("tileHorizontal")) _tileH = Field("tileHorizontal");
    if (FieldDefined("tileVertical")) _tileV = Field("tileVertical");
    if (FieldDefined("xSeperation")) _xSep = Field("xSeperation");
    if (FieldDefined("ySeperation")) _ySep = Field("ySeperation");

    var _tileW, _tileHgt;
    _tileW = _w * abs(image_xscale) + _xSep;
    _tileHgt = _h * abs(image_yscale) + _ySep;

    if (_tileW > 0 && _tileHgt > 0) {
        var _startX, _endX, _startY, _endY;
        _startX = x;
        _startY = y;

        if (_tileH) _endX = x + _tileW * 3;
        else _endX = x;

        if (_tileV) _endY = y + _tileHgt * 2;
        else _endY = y;

        var cy, cx;
        if (_useSpr) {
            for (cy = _startY; cy <= _endY; cy += _tileHgt) {
                for (cx = _startX; cx <= _endX; cx += _tileW) {
                    draw_sprite_ext(_handle, 0, cx, cy, image_xscale, image_yscale, image_angle, image_blend, 0.7);
                }
            }
        } else {
            for (cy = _startY; cy <= _endY; cy += _tileHgt) {
                for (cx = _startX; cx <= _endX; cx += _tileW) {
                    draw_background_part_ext(_handle, 0, 0, _w, _h, cx, cy, image_xscale, image_yscale, image_blend, 0.7);
                }
            }
        }
    }
}

// Indicator badge so the instance is easy to spot in the room editor
var _boxW, _boxH, _col;
_boxW = max(128, 32 * abs(image_xscale));
_boxH = max(32, 32 * abs(image_yscale));
_col = make_color_rgb(192, 0, 0);

draw_set_color(_col);
draw_set_alpha(65 / 255);
draw_rectangle(x, y, x + _boxW, y + _boxH, false);

draw_set_alpha(0.85);
draw_rectangle(x, y, x + _boxW, y + _boxH, true);

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _label;
if (_resName != "") _label = "PARALLAX: " + _resName;
else _label = "PARALLAX LAYER";
draw_text(x + _boxW / 2, y + _boxH / 2, _label);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);
*/

// Runtime initialization at Room Start
if (useSprite) {
    if (sprite_index != -1 && sprite_exists(sprite_index)) {
        rawWidth = sprite_get_width(sprite_index);
        rawHeight = sprite_get_height(sprite_index);
        tileWidth = rawWidth * abs(image_xscale) + xSeperation;
        tileHeight = rawHeight * abs(image_yscale) + ySeperation;
    }
} else {
    if (background != -1 && background_exists(background)) {
        rawWidth = background_get_width(background);
        rawHeight = background_get_height(background);
        tileWidth = rawWidth * abs(image_xscale) + xSeperation;
        tileHeight = rawHeight * abs(image_yscale) + ySeperation;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
if (tileWidth <= 0 || tileHeight <= 0) {
    if (background != -1 || sprite_index != -1) {
        event_perform(ev_other, ev_room_start);
    }
    if (tileWidth <= 0 || tileHeight <= 0) exit;
}

var _viewX, _viewY, _viewWidth, _viewHeight;
_viewX = view_xview[view_current];
_viewY = view_yview[view_current];
_viewWidth = view_wview[view_current];
_viewHeight = view_hview[view_current];

var _parallaxX, _parallaxY;
_parallaxX = x + xScroll + floor(_viewX * xMotionScale);
_parallaxY = y + yScroll + floor(_viewY * yMotionScale);

var _startX, _endX;
if (tileHorizontal) {
    _startX = _viewX + ((_parallaxX - _viewX) mod tileWidth) - tileWidth;
    _endX = _viewX + _viewWidth + tileWidth;
} else {
    _startX = _parallaxX;
    _endX = _parallaxX;
}

var _startY, _endY;
if (tileVertical) {
    _startY = _viewY + ((_parallaxY - _viewY) mod tileHeight) - tileHeight;
    _endY = _viewY + _viewHeight + tileHeight;
} else {
    _startY = _parallaxY;
    _endY = _parallaxY;
}

// Draw tiled parallax
var cy, cx;
if (useSprite) {
    for (cy = _startY; cy <= _endY; cy += tileHeight) {
        for (cx = _startX; cx <= _endX; cx += tileWidth) {
            draw_sprite_ext(sprite_index, image_index, cx, cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        }
    }
} else {
    for (cy = _startY; cy <= _endY; cy += tileHeight) {
        for (cx = _startX; cx <= _endX; cx += tileWidth) {
            draw_background_part_ext(background, 0, 0, rawWidth, rawHeight, cx, cy, image_xscale, image_yscale, image_blend, image_alpha);
        }
    }
}
