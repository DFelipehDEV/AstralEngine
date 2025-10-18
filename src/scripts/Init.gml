/// Init()
if (instance_exists(objSystems)) exit;
ShadersInit();
SoundInit();
SaveInit();

// Fonts
global.fontHUD = font_add_sprite(sprFontHUD, ord("0"), false, -2);
global.fontText = font_add_sprite(sprFontText, ord(","), true, 0);
global.fontResults = font_add_sprite(sprFontResults, ord("0"), false, -1);

// Player
global.playerRings = 0;
global.playerCheckTime = 0;
global.playerCheckpoint = noone;

global.gameState = GameStateRunning;
global.systems = instance_create(0, 0, objSystems);

SystemsAddSystem(InputSystem);
SystemsAddSystem(DeactivationSystem);
SystemsAddSystem(TimeSystem);
if (DEBUG) SystemsAddSystem(DebugSystem);
SystemsAddSystem(WindowSystem);
SettingsLoad();

// Finish initialization and start the game
if (!debug_mode) {
    room_goto_next();
}
else {
    room_goto(rmSpace_Colony);
}
