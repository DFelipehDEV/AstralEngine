/// Init()
// Initialize the game

InputInit();

// Fonts
global.fontHUD = font_add_sprite(sprFontHUD, ord("0"), false, -2);
global.fontText = font_add_sprite(sprFontText, ord(","), true, 0);
global.fontResults = font_add_sprite(sprFontResults, ord("0"), false, -1);

// Screen
global.screenSize = 1;
global.screenVSync = true;

global.gamepad = joystick_count();

// Volume
global.soundVolume = 1;
global.musicVolume = 1;
global.voiceVolume = 1;

// Player
global.playerRings = 0;
global.playerCheckTime = 0;
global.playerCheckpoint = noone;

// Game state
global.timeScale = 1; // Time movement multiplier, lower values make objects move slower, higher values make objects move faster, used for slow motion
global.gameState = GameStateRunning;

global.shaderHeat = shdHeat();
global.shaderColorSwap = shdColorSwap();

// Create essential controllers
if (!instance_exists(objMusicManager))
    instance_create(0, 0, objMusicManager);
if (!instance_exists(objRoomManager))
    instance_create(0, 0, objRoomManager);

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
ini_close();

// Finish initialization and start the game
if (!debug_mode) {
    room_goto_next();
}
else {
    room_goto(rmSpace_Colony);
}
