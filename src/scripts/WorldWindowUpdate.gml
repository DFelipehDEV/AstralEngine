/// WorldWindowUpdate()
if (keyboard_check_pressed(vk_f4)) {
    windowScale = WindowSetScale(windowScale + 1);
    Log("Resized window to " + string(global.ww) + "x" + string(global.wh));
}
