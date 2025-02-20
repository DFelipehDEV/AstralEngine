#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

global.roomTick = 0;
global.deactivateExceptions = ds_list_create();
global.gameTimeAllow = true;
global.gameTime = global.playerCheckTime;

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

if (global.gameTimeAllow) {
    global.gameTime += 1000 / 60 * global.timeScale;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activate debug mode

if (keyboard_check_pressed(vk_caps)) {
    if (DEBUG && !global.debug) {
        global.debug = true;
        PlaySound(sndRing);
        if (!instance_exists(objDebugMode))
            instance_create(0, 0, objDebugMode);
    }
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

if (global.roomTick > 2) {
    instance_deactivate_all(true);
    instance_activate_object(objPlatformMove);
    instance_activate_object(objVFX);
    instance_activate_object(objSingleton);
    instance_activate_object(gm82core_object);
    instance_activate_object(objTerrain);

    instance_deactivate_object(objSpikeMove)

    // Activate specific instances
    var _instance;
    for (_instance = 0; _instance < ds_list_size(global.deactivateExceptions); _instance += 1) {
        instance_activate_object(ds_list_find_value(global.deactivateExceptions, _instance));
    }

    // Activate on view objects
    instance_activate_region(view_xview[0] - 64, view_yview[0] - 32, ScreenWidth + 96, ScreenHeight + 96, 1);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset

global.roomTick = 0;
global.gameTime = global.playerCheckTime;
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Clear exceptions

ds_list_clear(global.deactivateExceptions);
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
/// Increase resolution

global.screenSize += 1;
event_user(0);
