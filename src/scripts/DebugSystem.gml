switch (argument0) {
    case ev_create:
        dbg_tools_init();
        global.debugMode = false;
        global.debugOverlay = false;
        break;

    case ev_step:
        if (keyboard_check_pressed(vk_tab) && !global.debugMode) {
            PlaySound(sndRing);
            global.debugMode = true;
        }
        if (!global.debugMode) exit;
        if (keyboard_check_pressed(vk_tab)) {
            global.debugOverlay = !global.debugOverlay;
        }

        if (keyboard_check_pressed(vk_control)) {
            if (mouse_wheel_up()) {
                view_wview[0] *= 0.9;
                view_hview[0] *= 0.9;
            }
            if (mouse_wheel_down()) {
                view_wview[0] /= 0.9;
                view_hview[0] /= 0.9;
            }
        }

        dbg_tools_step();
        break;
    case ev_draw:
        dbg_tools_draw();
        break;
}
