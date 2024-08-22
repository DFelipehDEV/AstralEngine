/// LoadSounds(basedirectory)
var basedir;
basedir = argument0;

sound_add_directory(basedir + "/SOUND", ".wav", 0, 1)
sound_add_directory_ext(basedir + "/MUSIC", ".ogg", 1, true, "");
sound_add_directory_ext(basedir + "/JINGLES", ".wav", 0, true, "");
