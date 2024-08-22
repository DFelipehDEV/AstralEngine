/// FadeMusic(fadeOut?)

if (instance_exists(objControllerMusic)) {
    if (argument0) {
        objControllerMusic.fadeIn = false;
        objControllerMusic.fadeOut = true;
    }
    else {
        objControllerMusic.fadeIn = true;
        objControllerMusic.fadeOut = false;
    }
}
