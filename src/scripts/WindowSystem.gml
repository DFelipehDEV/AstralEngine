/// WindowSystem(event)
switch (argument0) {
    case ev_create:
        global.windowScale = 1;
        global.windowVSync = true;
        break;

    case ev_step:
        if (keyboard_check_pressed(vk_f4)) global.windowScale = WindowSetScale(global.windowScale + 1);
        break;
}
