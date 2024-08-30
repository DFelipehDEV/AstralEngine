#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);

view_object[0] = id;
view_hborder[0] = ScreenWidthHalf * 0.99;
view_vborder[0] = ScreenHeightHalf * 0.98;

// Camera following settings
target = objPlayer; // Camera target to follow the object
delay = 0; // Size in frames of how long the lag remains

// Camera shift settings
xShift = 0; // Horizontal position shift
yShift = 0; // Vertical position shift

// Camera shake settings
yShakeOffset = 48; // Position of the camera when the camera is shaking
xShakeTimer = 0; // Duration of how long the horizontal shake lasts
yShakeTimer = 0; // Duration of how long the vertical shake lasts

// Camera borders
leftBorder = 0; // Camera left border
rightBorder = room_width; // Camera right border
topBorder = 0; // Camera top border
bottomBorder = room_height; // Camera bottom border

zoom = 1;
zoomTarget = zoom;
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
/// Shake

// Horizontal Shake
if (xShakeTimer > 0) {
    x += random_range(-17, 17);
    xShakeTimer -= 1;
}

// Vertical Shake
if (yShakeTimer > 0) {
    yShift = approach(yShift, yShakeOffset - round(yShakeTimer/2)*2, 10)
    y = SmoothStep(y, floor(y + yShift), 0.3);

    if (yShakeTimer mod 6 == 4) {
        yShakeOffset = -yShakeOffset;
    }
    yShakeTimer -= 1;
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
/// Decrease lag timer

// Check if the camera is stuck
if (delay > 0) {
    delay -= 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Shift
if (object_get_name(target) == "objPlayer") {
    var _targetSpeed;
    // Shift x-axis camera position
    switch(target.state) {
        case PlayerStateWaylauncher:
            if (target.keyLeft) {
                xShift = approach(xShift, -80, 10);
            }
            else if (target.keyRight) {
                xShift = approach(xShift, 80, 10);
            }
            else {
                xShift = approach(xShift, 0, 10);
            }
            break;

        default:
            _targetSpeed = (((target.x - target.xprevious)/global.deltaMultiplier) * 12);
            xShift = approach(xShift, round(_targetSpeed/2)*2, 7);
    }

    // Shift y-axis camera position
    switch(target.state) {
        case PlayerStateLookup:
            yShift = approach(yShift, -90, 3);
            break;

        case PlayerStateCrouch:
            yShift = approach(yShift, 90, 3);
            break;

        case PlayerStateWaylauncher:
            if (target.keyUp) {
                yShift = approach(yShift, -80, 10);
            }
            else if (target.keyDown) {
                yShift = approach(yShift, 80, 10);
            }
            else {
                yShift = approach(yShift, 0, 10);
            }
            break;

        case PlayerStateStomp:
            yShift = approach(yShift, 210, 3);
            break;

        default:
            // Only shift the camera if the y-shake timer is not active
            if (yShakeTimer == 0) {
                _targetSpeed = ((target.y - target.yprevious)/global.deltaMultiplier) * 5
                yShift = approach(yShift, round(_targetSpeed/2)*2, 6); // *5, *9
            }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shift to the target position

if (delay == 0 && target != noone) {
    if (target != objPlayer) {
        // Shift to the target position
        x = floor(SmoothStep(x, target.x + xShift, 0.2));
        y = floor(SmoothStep(y, target.y + yShift, 0.1));
    }
    // Follow the player
    else {
        if (target.state != PlayerStateDead) {
            // Shift to the player position
            // I could just have used lerp
            x = floor(SmoothStep(x, target.x + xShift, 0.3));
            y = floor(SmoothStep(y, target.y + yShift, 0.3)); //0.16
        }
    }
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
    zoom = SmoothStep(zoom, zoomTarget, 0.2);
    ViewSetZoom(zoom);
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Lost target

if (!instance_exists(target)) {
    target = noone;
}
