/// SettingsSave()
ini_open("configf.ini");

ini_write_real("window", "windowscale", sysWindow.windowScale);
ini_write_real("window", "vsync", sysWindow.windowVSync);
ini_write_real("volume", "sfxvolume", global.soundVolume);
ini_write_real("volume", "bgmvolume", global.musicVolume);
ini_write_real("volume", "voicevolume", global.voiceVolume);

ini_close();
