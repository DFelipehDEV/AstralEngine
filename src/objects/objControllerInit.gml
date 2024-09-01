#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Load initialization

Init();

// Load configurations
with (objRoomManager) {
    ini_open("configf.ini");
    global.screenSize = ini_read_real("config", "screen", 1);
    global.screenVSync = ini_read_real("config", "vsync", 1);
    event_user(0);
    ini_close();
}
ini_open("configf.ini");
global.soundVolume = ini_read_real("config", "sfxvolume", 0.5);
global.musicVolume = ini_read_real("config", "bgmvolume", 0.5);
global.voiceVolume = ini_read_real("config", "voicevolume", 0.5);
global.ambientVolume = ini_read_real("config", "ambientvolume", 0.5);

PlaySound("snd/DialogueOpen");
alarm[0] = 3;
if (debug_mode) {
    alarm[0] = 1;
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Next room

// Finish initialization and start the game
if (!debug_mode) {
    room_goto_next();
}
else {
    room_goto(rmTest);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Commands

// Alt + R resets config
if (keyboard_check(vk_alt) && keyboard_check(ord("R"))) {
    with (objRoomManager) {
        global.screenSize = 1;
        global.screenVSync = true;
        ini_open("configf.ini");
        ini_write_real("config", "screen", 1);
        ini_write_real("config", "vsync", 1);
        event_user(0);
        ini_close();
    }
    global.soundVolume = 1;
    global.musicVolume = 1;
    global.voiceVolume = 1;
    global.ambientVolume = 1;
    ini_open("configf.ini");
    ini_write_real("config", "sfxvolume", 1);
    ini_write_real("config", "bgmvolume", 1);
    ini_write_real("config", "voicevolume", 1);
    ini_write_real("config", "ambientvolume", 1);
    ini_close();
}
