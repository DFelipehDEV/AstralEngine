/// SettingsLoad()
ini_open("configf.ini");

World.windowScale = ini_read_real("window", "windowscale", 1);
World.windowVSync = ini_read_real("window", "vsync", 1);
global.soundVolume = ini_read_real("volume", "sfxvolume", 0.5);
global.musicVolume = ini_read_real("volume", "bgmvolume", 0.5);
global.voiceVolume = ini_read_real("volume", "voicevolume", 0.5);

if (ini_read_string("input", "buttonlayout", "xbox") == "playstation") {
    World.buttonSprite = sprPlaystationButtons;
} else {
    World.buttonSprite = sprXboxButtons;
}

ini_close();

WindowSetScale(World.windowScale);
