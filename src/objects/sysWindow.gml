#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sysWindow.windowScale = 1;
        sysWindow.windowVSync = true;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (keyboard_check_pressed(vk_f4)) {
            sysWindow.windowScale = WindowSetScale(sysWindow.windowScale + 1);
            Log("Resized window to " + string(window_get_width()) + "x" + string(window_get_height()));
        }
