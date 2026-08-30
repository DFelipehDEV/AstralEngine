#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();

// Target
target = noone;
delay = 0;
zoom = 1;
zoomTarget = zoom;

xInterpolationSpeed = 0.3;
yInterpolationSpeed = 0.3;
xShift = 0;
yShift = 0;
lockedX = -1;
lockedY = -1;

xShakeTimer = 0;
yShakeTimer = 0;
yShakeOffset = 48;

view = 0;
view_object[0] = id;
view_wview[0] = ScreenWidth;
view_hview[0] = ScreenHeight;
view_hborder[0] = ScreenWidthHalf * 0.97;
view_vborder[0] = ScreenHeightHalf * 0.97;
leftBorder = 0;
rightBorder = room_width;
topBorder = 0;
bottomBorder = room_height;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shake
// Horizontal Shake
if (xShakeTimer > 0) {
    x += random_range(-17, 17);
    xShakeTimer -= 1;
}

// Vertical Shake
if (yShakeTimer > 0) {
    yShift = approach(yShift, yShakeOffset - round(yShakeTimer/2)*2, 10 * global.timeScale)
    y = lerp(y, floor(y + yShift), 0.2 * global.timeScale);

    if (floor(yShakeTimer) mod 6 == 4) {
        yShakeOffset = -yShakeOffset;
    }
    yShakeTimer = max(yShakeTimer - global.timeScale, 0);
}


if (sign(yShakeOffset) == -1) {
    if (yShakeTimer == 0) {
        yShakeOffset = -yShakeOffset;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shift to the target position
delay = approach(delay, 0, global.timeScale);

if (instance_exists(target)) {
    var _targetX, _targetY;

    if (lockedX != -1) {
        _targetX = lockedX;
    } else {
        _targetX = target.x + xShift - (delay * 2.5);
    }

    if (lockedY != -1) {
        _targetY = lockedY;
    } else {
        _targetY = target.y + yShift;
    }

    x = floor(lerproach(x, _targetX, xInterpolationSpeed * global.timeScale, global.timeScale));
    y = floor(lerproach(y, _targetY, yInterpolationSpeed * global.timeScale, global.timeScale));
}

x = clamp(x, leftBorder + ScreenWidthHalf, rightBorder - ScreenWidthHalf);
y = clamp(y, topBorder + ScreenHeightHalf, bottomBorder - ScreenHeightHalf);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Zoom
if (zoom != zoomTarget) {
    zoom = lerp(zoom, zoomTarget, 0.15 * global.timeScale);
    ViewSetZoom(zoom);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field target: instance
//field zoom: number
//field xInterpolationSpeed : number
//field yInterpolationSpeed : number
//field leftBorder : number
//field rightBorder : number
//field topBorder : number
//field bottomBorder : number
