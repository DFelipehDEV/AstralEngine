/// DebugSystem(event)
switch (argument0) {
    case ev_create:
        global.debugMode = false;
        global.debugOverlay = false;
        break;

    case ev_step:
        if (keyboard_check_pressed(vk_tab) && !global.debugMode) {
            PlaySound(sndRing);
            global.debugMode = true;
        }

        if (!global.debugMode) exit;

        var _player;
        _player = instance_find(objPlayer, 0);

        if (keyboard_check_pressed(vk_tab)) {
            global.debugOverlay = !global.debugOverlay;
            if (_player != noone)
                _player.drawSensors = global.debugOverlay;
        }

        if (keyboard_check_pressed(ord("R"))) {
            room_restart();
        }

        if (keyboard_check_pressed(ord("L"))) {
            LoadGame();
        }

        if (keyboard_check_pressed(vk_end)) {
            var _loopstart;
            _loopstart = audio_get_loop_point_a(global.currentMusic);
            audio_music_set_pos(_loopstart - 10);
        }

        if (keyboard_check_pressed(vk_home)) {
            var _loopend;
            _loopend = audio_get_loop_point_b(global.currentMusic);
            audio_music_set_pos(_loopend - 10)
        }

        if (keyboard_check_pressed(vk_pageup)) {
            if (room_next(room) != -1) {
                room_goto_next();
                PlayerResetGlobalVariables();
            }
        }

        if (keyboard_check_pressed(vk_pagedown)) {
            if (room_previous(room) != -1) {
                room_goto_previous();
                PlayerResetGlobalVariables();
            }
        }

        if (_player != noone) {
            if (mouse_check_button(mb_right)) {
                _player.x = lerp(_player.x, mouse_x, 0.1);
                _player.y = lerp(_player.y, mouse_y, 0.1);
                _player.xSpeed = 0;
                _player.ySpeed = 0;
                _player.canMove = false;
                var _cam;
                _cam = _player.cam;
                if (instance_exists(_cam)) {
                    _cam.x = _player.x;
                    _cam.y = _player.y;
                }
            }

            if (mouse_check_button_released(mb_right)) {
                _player.canMove = true;
            }
        }

        if (mouse_check_button_released(mb_left)) {
            var _cam;
            _cam = instance_nearest(x, y, objCamera);
            if (_cam != noone) {
                if (collision_point(mouse_x, mouse_y, all, 0, 1)) {
                    _cam.target = instance_nearest(mouse_x, mouse_y, all);
                }
            }
        }

        if (mouse_wheel_up()) {
            view_wview[0] *= 0.9;
            view_hview[0] *= 0.9;
        }
        if (mouse_wheel_down()) {
            view_wview[0] /= 0.9;
            view_hview[0] /= 0.9;
        }
        break;

    case ev_draw:
        if (!global.debugOverlay) exit;
        BeginUI();
        draw_rect(333, 72, 179, 240, c_black, 0.5, 0);
        draw_set_font(fontConsolas8);
        draw_set_halign(fa_left);
        draw_set_color(c_white);

        var _player;
        _player = instance_find(objPlayer, 0);
        if (_player != noone) {
            // Debug overlay
            var _playerText;
            _playerText = "FPS:" + string(fps) + " " + string(fps_real)
            + "#TAB:TOGGLE OVERLAY#RMB:LERP PLAYER POSITION#R:RESTART ROOM#PGUP:NEXT ROOM#PGDN:PREVIOUS ROOM"
            + "#id:" + string(_player.id)
            + "#x:" + string(floor(_player.x)) + " " + string(_player.xSpeed)
            + "#y:" + string(floor(_player.y)) + " " + string(_player.ySpeed)
            + "#ground:" + string(_player.ground)
            + "#angle:" + string(_player.angle) + " " + string(_player.angleCos) + " " + string(_player.angleSin) + " " + string(_player.angleMode)
            + "#xDirection:" + string(_player.xDirection)
            + "#state:" + script_get_name(_player.state)
            + "#previousState:" + script_get_name(_player.previousState)
            + "#stateTimer:" + string(_player.stateTimer)
            + "#animation:" + _player.animation
            draw_text(333, 72, _playerText);
        }
        EndUI();
        break;
}
