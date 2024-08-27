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
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug

// Activate/deactivate debug overlay
if (keyboard_check_pressed(vk_tab)) {
    global.debugIsAThing = -global.debugIsAThing;
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
_playerExists = global.player[0] != noone;

if (mouse_check_button(mb_right)) {
    if (_playerExists) {
        global.player[0].x = lerp(global.player[0].x, mouse_x, 0.15);
        global.player[0].y = lerp(global.player[0].y, mouse_y, 0.15);
        global.player[0].xSpeed = 0;
        global.player[0].ySpeed = 0;
        global.player[0].movementAllow = false;
        global.player[0].cam.x = global.player[0].x;
        global.player[0].cam.y = global.player[0].y;
    }
}

if (mouse_check_button_released(mb_right)) {
    if (_playerExists) {
        global.player[0].movementAllow = true;
    }
}

if (mouse_check_button_released(mb_left)) {
    if (collision_point(mouse_x, mouse_y, all, 0, 1)) {

        objCamera.target = instance_nearest(mouse_x, mouse_y, all);
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

if (global.debugIsAThing) {
    if (global.player[0] != noone) {
        draw_sprite_ext(sprTrigger, 0, view_xview[0] + 333, view_yview[0] + 103, 179, 185, 0, c_black, 1);
        draw_set_color(c_white)
        draw_set_font(fontConsolas10)
        draw_set_halign(fa_left)
        draw_set_color(c_aqua)

        // Button guide
        draw_text(view_xview[0] + 333, view_yview[0] + 1, "TAB:TOGGLE OVERLAY#MOUSE RIGHT:LERP PLAYER POSITION#R:RESTART ROOM#PGUP:NEXT ROOM#PGDN:PREVIOUS ROOM#PAUSE:STOP AUDIO");
        draw_set_color(c_white)

        var _playerAction;
        _playerAction = string_replace_all(string(script_get_name(global.player[0].action)), "Player", ""); // Remove initial Player, for example from PlayerPlayerActionNormal to PlayerActionNormal
        // Debug overlay
        draw_text
        (view_xview[0] + 333, view_yview[0] + 57+48,
            string("XSPEED " + string(global.player[0].xSpeed)) + " " + string(floor(global.player[0].x))
        + string("#YSPEED " + string(global.player[0].ySpeed)) + " " + string(floor(global.player[0].y))
        + string("#GROUND " + string(global.player[0].ground))
        + string("#DIR " + string(global.player[0].xDirection))
        + string("#ACTION " + _playerAction)
        + string("#ANGLE " + string(global.player[0].angle) + " " + string(global.player[0].angleCos) + " " + string(global.player[0].angleSin) + " " + string(global.player[0].angleMode))
        + string("#FPS " + string(fps) + " " + string(fps_real))
        )
    }
}
