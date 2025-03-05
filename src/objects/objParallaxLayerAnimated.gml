#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);

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
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move

// Wrap texture
xScroll = xScroll mod (sprite_width + xSeperation);
yScroll = yScroll mod (sprite_height + ySeperation);

xScroll += xSpeed;
yScroll += ySpeed;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
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

/*preview
if (FieldDefined("sprite_index")) {
    var tileHorizontal, tileVertical, xMotionScale, yMotionScale, xSeperation, ySeperation;
    tileHorizontal = Field("tileHorizontal");
    tileVertical = Field("tileVertical");
    xMotionScale = Field("xMotionScale");
    yMotionScale = Field("yMotionScale");
    xSeperation = Field("xSeperation");
    ySeperation = Field("ySeperation");

    var _viewX, _viewY, _viewWidth, _viewHeight;
    _viewX = 0;
    _viewY = 0;
    _viewWidth = view_wview[view_current];
    _viewHeight = view_hview[view_current];

    var _parallaxX, _parallaxY, _tileWidth, _tileHeight;
    _parallaxX = x + floor(_viewX * xMotionScale);
    _parallaxY = y + floor(_viewY * yMotionScale);
    _tileWidth = sprite_width + xSeperation;
    _tileHeight = sprite_height + ySeperation;

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

    // Draw tiled background
    var cy, cx;
    for (cy = _startY; cy <= _endY; cy += _tileHeight) {
        for (cx = _startX; cx <= _endX; cx += _tileWidth) {
            draw_sprite_part_ext(sprite_index, image_index, 0, 0, sprite_width, sprite_height, cx, cy, image_xscale, image_yscale, image_blend, image_alpha);
        }
    }
}
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw

var _viewX, _viewY, _viewWidth, _viewHeight;
_viewX = view_xview[view_current];
_viewY = view_yview[view_current];
_viewWidth = view_wview[view_current];
_viewHeight = view_hview[view_current];

var _parallaxX, _parallaxY, _tileWidth, _tileHeight;
_parallaxX = x + xScroll + floor(_viewX * xMotionScale);
_parallaxY = y + yScroll + floor(_viewY * yMotionScale);
_tileWidth = sprite_width + xSeperation;
_tileHeight = sprite_height + ySeperation;

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

// Draw tiled background
var cy, cx;
for (cy = _startY; cy <= _endY; cy += _tileHeight) {
    for (cx = _startX; cx <= _endX; cx += _tileWidth) {
        draw_sprite_ext(sprite_index, image_index, cx, cy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
