#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

global.roomTick = 0;
global.deactivateExceptions = ds_list_create();
DeactivateExceptionsAdd(parPlatformMove);
DeactivateExceptionsAdd(parVFX);
DeactivateExceptionsAdd(parSingleton);
DeactivateExceptionsAdd(gm82core_object);

application_surface_enable(ApplicationSurfacePost)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Center window

window_center();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Timer

if (!GameStateGet(GameStatePaused)) {
    global.roomTick += 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Zoom

if (global.zoom != global.zoomValue) {
    global.zoom = SmoothStep(global.zoom, global.zoomValue, 0.2);
    ViewSetZoom(global.zoom);
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variable updating

if (global.roomTick mod 90 == 1) {
    global.gamepad = joystick_count() == 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Deactivate offscreen objects

if (GameStateGet() == GameStatePaused) exit;

instance_deactivate_all(true);
instance_activate_object(parTerrain);

// Activate specific instances
var _instance;
for (_instance = 0; _instance < ds_list_size(global.deactivateExceptions); _instance += 1) {
    instance_activate_object(ds_list_find_value(global.deactivateExceptions, _instance));
}

instance_deactivate_object(objSpikeMove)

// Activate on view objects
instance_activate_region(view_xview[0] - 64, view_yview[0] - 32, ScreenWidth + 96, ScreenHeight + 96, 1);

if (instance_exists(objRingDrop)) {
    instance_activate_region(objRingDrop.x - 16, objRingDrop.y - 16, 64, 64, 1);
}

if (instance_exists(objPlayer)) {
    instance_activate_region(objPlayer.x - 64, objPlayer.y - 64, 128, 128, 1);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset

global.roomTick = 0;
global.zoom = 1;
global.zoomValue = 1;
ViewSetZoom(global.zoom)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Clear exceptions

ds_list_clear(global.deactivateExceptions);
DeactivateExceptionsAdd(parPlatformMove);
DeactivateExceptionsAdd(parVFX);
DeactivateExceptionsAdd(parSingleton);
DeactivateExceptionsAdd(gm82core_object);
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Resize

// Set to the minimum size if the window is too big
if (global.screenSize >= 4 || global.screenSize != 3 && window_get_fullscreen()) {
    global.screenSize = 1;
    window_set_fullscreen(false);
}

window_set_size(ScreenWidth * global.screenSize, ScreenHeight * global.screenSize);
window_set_region_size(ScreenWidth, ScreenHeight, 1);

// Fullscreen
if (global.screenSize == 3) {
    window_set_size(ScreenWidth, ScreenHeight);
    window_set_fullscreen(true);
}

// Center window
alarm[0] = 2;
#define KeyPress_115
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change resolution

global.screenSize += 1;
event_user(0);
