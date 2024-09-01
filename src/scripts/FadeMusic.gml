/// FadeMusic(fadeOut?)

if (instance_exists(objMusicManager)) {
    if (argument0) {
        objMusicManager.fadeIn = false;
        objMusicManager.fadeOut = true;
    }
    else {
        objMusicManager.fadeIn = true;
        objMusicManager.fadeOut = false;
    }
}
