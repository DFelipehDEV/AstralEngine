/// dbg_tools_draw()
//DBGTools Version 0.1
if (im_main_menu_bar_begin()) {
    if (im_menu_begin("Theme")) {
        if (im_menu_item("Light Mode")) im_style_light();
        if (im_menu_item("Dark Mode")) im_style_dark();
        im_menu_end();
    }

    if (im_menu_begin("Room")) {
        im_push_item_width(200);
        var _currentRoomComboIdx, _newRoomComboIdx;
        if (ds_map_exists(global.debugRoomMap, room)) {
            _currentRoomComboIdx = ds_map_find_value(global.debugRoomMap, room);
        } else {
            _currentRoomComboIdx = 0;
        }

        _newRoomComboIdx = im_combo("##room_selection", _currentRoomComboIdx, global.debugRoomsCSV);
        if (_newRoomComboIdx != _currentRoomComboIdx) {
            room_goto(ds_list_find_value(global.debugRoomList, _newRoomComboIdx));
        }
        im_pop_item_width();
        if (im_menu_item("Restart Room")) room_restart();
        im_menu_end();
    }
    im_text("FPS: " + string(fps) + "/" + string(fps_real));
    im_text("CPU: " + string(get_cpu_usage()));
    im_text("RAM: " + string(get_ram_usage()/1024/1024) + "MB");

    im_main_menu_bar_end();
}

if (instance_exists(global.debugSelectedInstance)) {
    var _sel;
    _sel = global.debugSelectedInstance
    draw_rectangle_color(_sel.bbox_left,
                        _sel.bbox_top,
                        _sel.bbox_right,
                        _sel.bbox_bottom,
                        c_white, c_white, c_white, c_white,
                        true
    );

    if (im_begin_popup_context_void("##Debug Context Menu")) {
        if (im_menu_item("Watch")) {
            if (ds_list_find_index(global.debugInstancesBeingWatched, _sel) == -1) {
                ds_list_add(global.debugInstancesBeingWatched, _sel);
            }
        }
        if (global.debugViewInstance == _sel) {
            if (im_menu_item("Stop Following")) {
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
            }
        } else {
            if (im_menu_item("Follow")) {
                global.debugViewInstance = _sel;
                global.debugPreviousViewInstance = view_object[0];
                view_object[0] = global.debugViewInstance;
            }
        }
        im_end_popup();
    }
} else {
    global.debugSelectedInstance = noone;
}

var i, _obj;
for (i = 0; i < ds_list_size(global.debugInstancesBeingWatched); i += 1) {
    _obj = ds_list_find_value(global.debugInstancesBeingWatched, i);

    if (instance_exists(_obj)) {
        var _opened;
        _opened = im_window_begin_closable("Watching " + object_get_name(_obj.object_index) + ", id:" + string(_obj), true);

        if (!_opened) {
            ds_list_delete(global.debugInstancesBeingWatched, i);
            i -= 1;
            im_window_end();
            continue;
        }

        var _tableFlags;
        _tableFlags = im_table_resizable | im_table_row_bg | im_table_sizing_stretch_prop;
        if (im_collapsing_header("Built-in Variables")) {
            if (im_begin_table("BuiltInTable_" + string(_obj), 2, _tableFlags)) {

                _obj.x = im_draw_property_real("x", _obj.x, 0);
                _obj.y = im_draw_property_real("y", _obj.y, 0);

                im_table_next_row_and_column(); im_text("sprite_index");
                im_table_next_column(); im_push_item_width(-1);

                var _currentComboIdx, _newComboIdx;
                if (ds_map_exists(global.debugSpriteMap, _obj.sprite_index)) {
                    _currentComboIdx = ds_map_find_value(global.debugSpriteMap, _obj.sprite_index);
                } else {
                    _currentComboIdx = 0;
                }

                _newComboIdx = im_combo("##sprite_index", _currentComboIdx, global.debugSpritesCSV);
                if (_newComboIdx != _currentComboIdx) {
                    _obj.sprite_index = ds_list_find_value(global.debugSpriteList, _newComboIdx);
                }
                im_pop_item_width();

                im_table_next_row_and_column(); im_text("preview");
                im_table_next_column(); im_sprite(_obj.sprite_index, floor(_obj.image_index));

                _obj.image_index = im_draw_property_real("image_index", _obj.image_index, 0);
                _obj.image_speed = im_draw_property_real("image_speed", _obj.image_speed, 0);
                _obj.image_angle = im_draw_property_real("image_angle", _obj.image_angle, 0);
                _obj.image_xscale = im_draw_property_real("image_xscale", _obj.image_xscale, 0);
                _obj.image_yscale = im_draw_property_real("image_yscale", _obj.image_yscale, 0);

                _obj.image_blend = im_draw_property_color("image_blend", _obj.image_blend, 0);
                _obj.image_alpha = im_draw_property_real("image_alpha", _obj.image_alpha, 0);

                _obj.depth = im_draw_property_real("depth", _obj.depth, 0);

                _obj.hspeed = im_draw_property_real("hspeed", _obj.hspeed, 0);
                _obj.vspeed = im_draw_property_real("vspeed", _obj.vspeed, 0);
                _obj.speed = im_draw_property_real("speed", _obj.speed, 0);
                _obj.friction = im_draw_property_real("friction", _obj.friction, 0);
                _obj.gravity = im_draw_property_real("gravity", _obj.gravity, 0);
                _obj.gravity_direction = im_draw_property_real("gravity_direction", _obj.gravity_direction, 0);
                _obj.direction = im_draw_property_real("direction", _obj.direction, 0);
                im_draw_property_real("xstart", _obj.xstart, im_input_text_read_only);
                im_draw_property_real("ystart", _obj.ystart, im_input_text_read_only);
                im_draw_property_real("xprevious", _obj.xprevious, im_input_text_read_only);
                im_draw_property_real("yprevious", _obj.yprevious, im_input_text_read_only);

                im_end_table();
            }

            _obj.visible = im_checkbox("visible", _obj.visible);
            _obj.solid = im_checkbox("solid", _obj.solid);
            _obj.persistent = im_checkbox("persistent", _obj.persistent);
        }
        if (im_collapsing_header("Instance Variables")) {
            if (im_begin_table("InstanceVarsTable_" + string(_obj), 2, _tableFlags)) {
                var _varName, _varValue;

                repeat(variable_instance_count(_obj)) {
                    _varName = variable_instance_get_next();
                    _varValue = variable_instance_get(_obj, _varName);

                    if (is_real(_varValue)) {
                        variable_instance_set(_obj, _varName, im_draw_property_real(_varName, _varValue, 0));
                    } else {
                        variable_instance_set(_obj, _varName, im_draw_property_text(_varName, _varValue, 0));
                    }
                }

                im_end_table();
            }
        }
        im_window_end();
    } else {
        ds_list_delete(global.debugInstancesBeingWatched, i);
        i -= 1;
    }
}
