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
var useSprite;
useSprite = false;
if (FieldDefined("useSprite")) useSprite = Field("useSprite");

var width, height, _bg, _spr, _hasResource;
width = 0;
height = 0;
_bg = -1;
_spr = -1;
_hasResource = false;

if (useSprite) {
    if (FieldDefined("sprite_index")) {
        _spr = Sprite(Field("sprite_index"), 0);
        width = sprite_get_width(_spr);
        height = sprite_get_height(_spr);
        _hasResource = true;
    }
} else {
    if (FieldDefined("background")) {
        _bg = Background(Field("background"));
        width = background_get_width(_bg);
        height = background_get_height(_bg);
        _hasResource = true;
    }
}

if (_hasResource) {
    var tileHorizontal, tileVertical, xMotionScale, yMotionScale, xSeperation, ySeperation;
    tileHorizontal = false;
    tileVertical = false;
    xMotionScale = 1;
    yMotionScale = 1;
    xSeperation = 0;
    ySeperation = 0;

    if (FieldDefined("tileHorizontal")) tileHorizontal = Field("tileHorizontal");
    if (FieldDefined("tileVertical")) tileVertical = Field("tileVertical");
    if (FieldDefined("xMotionScale")) xMotionScale = Field("xMotionScale");
    if (FieldDefined("yMotionScale")) yMotionScale = Field("yMotionScale");
    if (FieldDefined("xSeperation")) xSeperation = Field("xSeperation");
    if (FieldDefined("ySeperation")) ySeperation = Field("ySeperation");

    var _viewX, _viewY, _viewWidth, _viewHeight;
    _viewX = 0;
    _viewY = 0;
    _viewWidth = view_wview[view_current];
    _viewHeight = view_hview[view_current];

    var _parallaxX, _parallaxY, _tileWidth, _tileHeight;
    _parallaxX = x + floor(_viewX * xMotionScale);
    _parallaxY = y + floor(_viewY * yMotionScale);
    _tileWidth = width * abs(image_xscale) + xSeperation;
    _tileHeight = height * abs(image_yscale) + ySeperation;

    if (_tileWidth > 0 && _tileHeight > 0) {
        var _startX, _endX;
        if (tileHorizontal) {
            _startX = _viewX + ((_parallaxX - _viewX) mod _tileWidth) - _tileWidth;
            _endX = _viewX + _viewWidth + _tileWidth;
        } else {
            _startX = _parallaxX;
            _endX = _parallaxX;
        }

        var _startY, _endY;
        if (tileVertical) {
            _startY = _viewY + ((_parallaxY - _viewY) mod _tileHeight) - _tileHeight;
            _endY = _viewY + _viewHeight + _tileHeight;
        } else {
            _startY = _parallaxY;
            _endY = _parallaxY;
        }

        // Draw tiled background / sprite
        var cy, cx;
        if (useSprite) {
            for (cy = _startY; cy <= _endY; cy += _tileHeight) {
                for (cx = _startX; cx <= _endX; cx += _tileWidth) {
                    draw_sprite_part_ext(_spr, image_index, 0, 0, width, height, cx, cy, image_xscale, image_yscale, image_blend, image_alpha);
                }
            }
        } else {
            for (cy = _startY; cy <= _endY; cy += _tileHeight) {
                for (cx = _startX; cx <= _endX; cx += _tileWidth) {
                    draw_background_part_ext(_bg, 0, 0, width, height, cx, cy, image_xscale, image_yscale, image_blend, image_alpha);
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
draw_text(x + _boxW / 2, y + _boxH / 2, "PARALLAX LAYER");

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
