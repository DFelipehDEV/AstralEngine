/// FadeMusic(fadeOut?)

if (instance_exists(objMusicManager)) {
    if (argument0) {
        audio_music_stop(15);
    }
    else {
        audio_music_play(music, 15);
    }
}
