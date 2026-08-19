/// WorldDebugUpdate()
if (keyboard_check_pressed(vk_tab) && !debugMode) {
    PlaySound(sndRing);
    debugMode = true;
}

if (!debugMode) exit;

var _player;
_player = instance_find(objPlayer, 0);

if (keyboard_check_pressed(vk_tab)) {
    debugOverlay = !debugOverlay;
    if (_player != noone) {
        _player.drawSensors = debugOverlay;
        _player.depth = pick(debugOverlay, -1, -9999);
    }
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
        audio_sfx_stop();
        PlayerResetGlobalVariables();
    }
}

if (keyboard_check_pressed(vk_pagedown)) {
    if (room_previous(room) != -1) {
        room_goto_previous();
        audio_sfx_stop();
        PlayerResetGlobalVariables();
    }
}

if (keyboard_check_pressed(vk_f1)) {
    instance_activate_all();
    all.visible = true;
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
