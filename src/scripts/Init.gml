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
global.currentCheckpoint = dss_map_create();
ds_map_add(global.currentCheckpoint, "instance", noone);
ds_map_add(global.currentCheckpoint, "rings", 0);
ds_map_add(global.currentCheckpoint, "time", 0);

global.gameState = GameStateRunning;
global.systems = instance_create(0, 0, objSystems);

SystemsAddSystem(InputSystem);
SystemsAddSystem(DeactivationSystem);
SystemsAddSystem(TimeSystem);
SystemsAddSystem(WindowSystem);
if (DebugBuild) {
    SystemsAddSystem(DebugSystem);
    if (debug_mode)
        SystemsAddSystem(LogSystem);
}
SettingsLoad();

// Finish initialization and start the game
if (!debug_mode) {
    room_goto_next();
} else {
    room_goto(rmSpace_Colony);
}
