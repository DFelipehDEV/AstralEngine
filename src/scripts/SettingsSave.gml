/// SettingsSave()
ini_open("configf.ini");

ini_write_real("window", "windowscale", World.windowScale);
ini_write_real("window", "vsync", World.windowVSync);
ini_write_real("volume", "sfxvolume", global.soundVolume);
ini_write_real("volume", "bgmvolume", global.musicVolume);
ini_write_real("volume", "voicevolume", global.voiceVolume);
ini_write_string("input", "buttonlayout", pick(World.buttonSprite == sprPlaystationButtons, "xbox", "playstation"));

ini_close();
