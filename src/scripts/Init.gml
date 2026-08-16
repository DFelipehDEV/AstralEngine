/// Init()
if (instance_exists(objWorld)) exit;

if (gm82core_version < 160) {
    show_error("You are using a gm82core extension version older than 1.6, only version 1.6 and higher are supported. Update by downloading a newer gm82 build from gm82.cherry-treehouse.com or by building it from source.", true);
}

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

application_surface_enable(ApplicationSurfacePost);
instance_create(0, 0, objWorld);
SettingsLoad();

// Finish initialization and start the game
if (!debug_mode) {
    room_goto_next();
} else {
    room_goto(rmSpace_Colony);
}
