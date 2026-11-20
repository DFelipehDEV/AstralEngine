/// dbg_tools_step()
//DBGTools Version 0.2
/*
if (mouse_check_button_pressed(mb_right)) {
    global.debugSelectedInstance = noone;
    with (all) {
        var _result;
        _result = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
        if (_result) {
            global.debugSelectedInstance = id;
        }
    }
}
