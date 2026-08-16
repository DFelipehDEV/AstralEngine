/// SettingsLoad()
ini_open("configf.ini");

objWorld.windowScale = ini_read_real("window", "windowscale", 1);
objWorld.windowVSync = ini_read_real("window", "vsync", 1);
global.soundVolume = ini_read_real("volume", "sfxvolume", 0.5);
global.musicVolume = ini_read_real("volume", "bgmvolume", 0.5);
global.voiceVolume = ini_read_real("volume", "voicevolume", 0.5);

ini_close();

WindowSetScale(objWorld.windowScale);
