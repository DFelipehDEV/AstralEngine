#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();

background = 0;

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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move

// Wrap texture
xScroll = xScroll mod (background_get_width(background) + xSeperation);
yScroll = yScroll mod (background_get_height(background) + ySeperation);

xScroll += xSpeed;
yScroll += ySpeed;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field background: background
//field tileHorizontal: bool
//field tileVertical: bool
//field xMotionScale: number
//field yMotionScale: number
//field xSeperation: number
//field ySeperation: number
//field xSpeed: number
//field ySpeed: number

/*preview
if (FieldDefined("background")) {
    var background, tileHorizontal, tileVertical, xMotionScale, yMotionScale, xSeperation, ySeperation;
    background = Background(Field("background"));
    tileHorizontal = Field("tileHorizontal");
    tileVertical = Field("tileVertical");
    xMotionScale = Field("xMotionScale");
    yMotionScale = Field("yMotionScale");
    xSeperation = Field("xSeperation");
    ySeperation = Field("ySeperation");

    var width, height;
    width = background_get_width(background);
    height = background_get_height(background);

    var _viewX, _viewY, _viewWidth, _viewHeight;
    _viewX = 0;
    _viewY = 0;
    _viewWidth = view_wview[view_current];
    _viewHeight = view_hview[view_current];

    var _parallaxX, _parallaxY, _tileWidth, _tileHeight;
    _parallaxX = x + floor(_viewX * xMotionScale);
    _parallaxY = y + floor(_viewY * yMotionScale);
    _tileWidth = width + xSeperation;
    _tileHeight = height + ySeperation;

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
            draw_background_part_ext(background, 0, 0, width, height, cx, cy, image_xscale, image_yscale, image_blend, image_alpha);
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

if (background_exists(background)) {
    var width, height;
    width = background_get_width(background);
    height = background_get_height(background);

    var _viewX, _viewY, _viewWidth, _viewHeight;
    _viewX = view_xview[view_current];
    _viewY = view_yview[view_current];
    _viewWidth = view_wview[view_current];
    _viewHeight = view_hview[view_current];

    var _parallaxX, _parallaxY, _tileWidth, _tileHeight;
    _parallaxX = x + xScroll + floor(_viewX * xMotionScale);
    _parallaxY = y + yScroll + floor(_viewY * yMotionScale);
    _tileWidth = width + xSeperation;
    _tileHeight = height + ySeperation;

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
            draw_background_part_ext(background, 0, 0, width, height, cx, cy, image_xscale, image_yscale, image_blend, image_alpha);
        }
    }
}
