#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug

if (!global.debug) {
    instance_destroy();
}

overlay = false;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug

// Activate/deactivate debug overlay
if (keyboard_check_pressed(vk_tab)) {
    overlay = !overlay;
    objPlayer.drawSensors = overlay;
}

// Restart room
if (keyboard_check_pressed(ord("R"))) {
    room_restart();
}

// Skip music to near loop point
if (keyboard_check_pressed(vk_end)) {
    var _loopstart;
    _loopstart = objControllerMusic.loopStart;
    sound_set_pos(global.bgmSound, _loopstart - 10, true)
}

// Skip music to near loop point
if (keyboard_check_pressed(vk_home)) {
    var _loopend;
    _loopend = objControllerMusic.loopEnd;
    sound_set_pos(global.bgmSound, _loopend - 10, true)
}

// Stop all sounds
if (keyboard_check_pressed(vk_pause)) {
    sound_stop_all();
}

// Go to next room
if (keyboard_check_pressed(vk_pageup)) {
    // Check if there is a next room
    if (room_next(room) != -1) {
        room_goto_next();
        PlayerGlobalsReset();
    }
}

// Go to previous room
if (keyboard_check_pressed(vk_pagedown)) {
    // Check if there is a previous room
    if (room_previous(room) != -1) {
        room_goto_previous();
        PlayerGlobalsReset();
    }
}

var _playerExists;
_playerExists = instance_exists(global.player[0]);

if (_playerExists) {
    if (mouse_check_button(mb_right)) {
        global.player[0].x = lerp(global.player[0].x, mouse_x, 0.15);
        global.player[0].y = lerp(global.player[0].y, mouse_y, 0.15);
        global.player[0].xSpeed = 0;
        global.player[0].ySpeed = 0;
        global.player[0].movementAllow = false;
        global.player[0].cam.x = global.player[0].x;
    }

    if (mouse_check_button_released(mb_right)) {
        global.player[0].movementAllow = true;
    }
}

if (mouse_check_button_released(mb_left)) {
    var _cam;
    _cam = instance_nearest(x, y, objCamera);
    if (collision_point(mouse_x, mouse_y, all, 0, 1)) {
        _cam.target = instance_nearest(mouse_x, mouse_y, all);
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug overlay

if (overlay) {
    if (instance_exists(global.player[0])) {
        draw_sprite_ext(sprTrigger, 0, view_xview[0] + 333, view_yview[0] + 103, 179, 185, 0, c_black, 1);
        draw_set_color(c_white)
        draw_set_font(fontConsolas8AA1)
        draw_set_halign(fa_left)
        draw_set_color(c_white)

        // Button guide
        draw_text(view_xview[0], view_yview[0], "TAB:TOGGLE OVERLAY#MOUSE RIGHT:LERP PLAYER POSITION#R:RESTART ROOM#PGUP:NEXT ROOM#PGDN:PREVIOUS ROOM#PAUSE:STOP AUDIO");
        draw_set_color(c_white)

        var _playerAction;
        _playerAction = string_replace_all(string(script_get_name(global.player[0].action)), "Player", ""); // Remove initial 'Player', (e.g., from PlayerPlayerActionNormal to PlayerActionNormal)
        // Debug overlay
        draw_text
        (view_xview[0] + 333, view_yview[0] + 103,
        "XSPEED " + string(global.player[0].xSpeed) + " " + string(floor(global.player[0].x))
        + "#YSPEED " + string(global.player[0].ySpeed) + " " + string(floor(global.player[0].y))
        + "#GROUND " + string(global.player[0].ground)
        + "#DIR " + string(global.player[0].xDirection)
        + "#ACTION " + _playerAction
        + "#ANGLE " + string(global.player[0].angle) + " " + string(global.player[0].angleCos) + " " + string(global.player[0].angleSin) + " " + string(global.player[0].angleMode)
        )
    }
}
