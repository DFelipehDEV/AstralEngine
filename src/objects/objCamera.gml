#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
// Viewport configuration
view_object[0] = id;
view_hborder[0] = ScreenWidthHalf * 0.99;
view_vborder[0] = ScreenHeightHalf * 0.98;

// Camera following settings
camTarget = objPlayer; // Camera target to follow the object
camLagTimer = 0; // Size in frames of how long the lag remains

// Camera shift settings
camXShift = 0; // Horizontal position shift
camYShift = 0; // Vertical position shift

// Camera shake settings
camYShakeValue = 48; // Position of the camera when the camera is shaking
camXShakeTimer = 0; // Duration of how long the horizontal shake lasts
camYShakeTimer = 0; // Duration of how long the vertical shake lasts

// Camera borders
camBorderLeft = 0; // Camera left border
camBorderRight = room_width; // Camera right border
camBorderTop = 0; // Camera top border
camBorderBottom = room_height; // Camera bottom border
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
if (camXShakeTimer > 0) {
    x += random_range(-17, 17);
    camXShakeTimer -= 1;
}

// Vertical Shake
if (camYShakeTimer > 0) {
    camYShift = approach(camYShift, camYShakeValue - round(camYShakeTimer/2)*2, 10)
    y = SmoothStep(y, floor(y + camYShift), 0.3);

    if (camYShakeTimer mod 6 == 4) {
        camYShakeValue = -camYShakeValue;
    }
    camYShakeTimer -= 1;
}


if (sign(camYShakeValue) == -1) {
    if (camYShakeTimer == 0) {
        camYShakeValue = -camYShakeValue;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Decrease lag timer

// Check if the camera is stuck
if (camLagTimer > 0) {
    camLagTimer -= 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Shift
if (object_get_name(camTarget) == "objPlayer") {
    var _targetSpeed;
    // Shift x-axis camera position
    switch(camTarget.action) {
        case PlayerActionWaylauncher:
            if (camTarget.keyLeft) {
                camXShift = approach(camXShift, -80, 10);
            }
            else if (camTarget.keyRight) {
                camXShift = approach(camXShift, 80, 10);
            }
            else {
                camXShift = approach(camXShift, 0, 10);
            }
            break;

        default:
            _targetSpeed = (((camTarget.x - camTarget.xprevious)/global.deltaMultiplier) * 12);
            camXShift = approach(camXShift, round(_targetSpeed/2)*2, 7);
    }

    // Shift y-axis camera position
    switch(camTarget.action) {
        case PlayerActionLookup:
            camYShift = approach(camYShift, -90, 3);
            break;

        case PlayerActionCrouch:
            camYShift = approach(camYShift, 90, 3);
            break;

        case PlayerActionWaylauncher:
            if (camTarget.keyUp) {
                camYShift = approach(camYShift, -80, 10);
            }
            else if (camTarget.keyDown) {
                camYShift = approach(camYShift, 80, 10);
            }
            else {
                camYShift = approach(camYShift, 0, 10);
            }
            break;

        case PlayerActionStomp:
            camYShift = approach(camYShift, 210, 3);
            break;

        default:
            // Only shift the camera if the y-shake timer is not active
            if (camYShakeTimer == 0) {
                _targetSpeed = ((camTarget.y - camTarget.yprevious)/global.deltaMultiplier) * 5
                camYShift = approach(camYShift, round(_targetSpeed/2)*2, 6); // *5, *9
            }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shift to the target position

if (camLagTimer == 0 && camTarget != noone) {
    if (camTarget != objPlayer) {
        // Shift to the target position
        x = floor(SmoothStep(x, camTarget.x + camXShift, 0.2));
        y = floor(SmoothStep(y, camTarget.y + camYShift, 0.1));
    }
    // Follow the player
    else {
        if (camTarget.action != PlayerActionDead) {
            // Shift to the player position
            // I could just have used lerp
            x = floor(SmoothStep(x, camTarget.x + camXShift, 0.3));
            y = floor(SmoothStep(y, camTarget.y + camYShift, 0.3)); //0.16
        }
    }
}

x = clamp(x, camBorderLeft + ScreenWidthHalf, camBorderRight - ScreenWidthHalf);
y = clamp(y, camBorderTop + ScreenHeightHalf, camBorderBottom - ScreenHeightHalf);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Lost target

if (!instance_exists(camTarget)) {
    camTarget = noone;
}
