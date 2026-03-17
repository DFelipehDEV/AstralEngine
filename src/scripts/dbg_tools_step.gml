/// dbg_tools_step()
//DBGTools Version 0.1
if (mouse_check_button_pressed(mb_right)) {
    if (keyboard_check(vk_shift)) {
        global.debugSelectedInstance = noone;
        ds_list_clear(global.debugInstancesBeingWatched);
        if (view_object[0] == global.debugViewInstance) {
            if (instance_exists(global.debugPreviousViewInstance)) {
                global.debugViewInstance = global.debugPreviousViewInstance;
            } else {
                global.debugViewInstance = noone;
            }
            view_object[0] = global.debugViewInstance;
        }
    } else {
        global.debugSelectedInstance = noone;
        with (all) {
            var _result;
            _result = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
            if (_result) {
                global.debugSelectedInstance = id;
            }
        }
    }
}
