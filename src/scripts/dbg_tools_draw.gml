/// dbg_tools_draw()
//DBGTools Version 0.2
/*
if (im_main_menu_bar_begin()) {
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
    if (im_menu_begin("Tools")) {
        if (im_menu_item("Developer Console")) {
            global.showDeveloperConsole = true;
        }
        im_menu_end();
    }
    if (im_menu_begin("Legal")) {
        if (im_menu_item("Credits")) {
            global.debugShowLegalCredits = true;
        }
        im_menu_end();
    }
    im_text("FPS: " + string(fps) + "/" + string(fps_real));
    im_text("CPU: " + string(get_cpu_usage()) + "%");
    im_text("RAM: " + string(get_ram_usage()/1024/1024) + "MB");

    im_main_menu_bar_end();
}

if (global.debugShowLegalCredits) {
    if (!im_window_begin_closable("Credits", true)) {
        global.debugShowLegalCredits = false;
    } else {
        im_text("==================================
Dear ImGui
URL: https://github.com/ocornut/imgui

The MIT License (MIT)

Copyright (c) 2014-2026 Omar Cornut

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the Software), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
==================================
MinHook
URL: https://github.com/TsudaKageyu/minhook

MinHook - The Minimalistic API Hooking Library for x64/x86
Copyright (C) 2009-2017 Tsuda Kageyu.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
AS IS AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER
OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

================================================================================
Portions of this software are Copyright (c) 2008-2009, Vyacheslav Patkov.
================================================================================
Hacker Disassembler Engine 32 C
Copyright (c) 2008-2009, Vyacheslav Patkov.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
AS IS AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

-------------------------------------------------------------------------------
Hacker Disassembler Engine 64 C
Copyright (c) 2008-2009, Vyacheslav Patkov.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
AS IS AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
==================================
imgui_impl_dx8
Authors: KoMaR1911, seremo, C4US Project
==================================
DirectX 8 API Headers
Copyright (C) Microsoft Corporation. All Rights Reserved."
        );
    }
    im_window_end();
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
