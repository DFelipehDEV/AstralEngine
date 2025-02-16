#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
fontSpace = 14;
image_alpha = 0;

optionMax = 6;
var i;
for (i = 0; i < optionMax; i += 1) {
    optionX[i] = -400;
    optionY[i] = fontSpace*(i + 1);
}

optionSelected = 0;
scale = 0;
delay = 0;
leaved = false;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Options

if (leaved) exit;
image_alpha = approach(image_alpha, 0.9, 0.05);

var i;
for (i = 0; i < optionMax; i += 1) {
    optionX[i] = lerp(optionX[i], 30, 0.2);
}

scale = approach(scale, ScreenWidth, 8);
delay = max(delay - 1, 0);

// Options
switch(optionSelected) {
    // Resolution
    case 0:
        if (delay = 0) {
            // Change option
            if (sysinput_get("down")) {
                optionSelected += 1;
                PlaySound(sndMenuSelect);
                scale = 0;
                delay = 20;
            }

            if (sysinput_get("right"))  {
                with (objRoomManager) {
                    global.screenSize += 1;
                    event_user(0);
                }
                delay = 25;
            }

            if ((sysinput_get("left"))  && global.screenSize > 1) {
                with (objRoomManager) {
                    global.screenSize -= 1;
                    event_user(0);
                }
                delay = 25;
            }
        }
        break;

    // Music
    case 1:
        if (delay == 0) {
            // Change option
            if (sysinput_get("up") && delay == 0) {
                optionSelected -= 1;
                PlaySound(sndMenuSelect);
                scale = 0;
                delay = 20;
            }

            // Change option
            if (sysinput_get("down")) {
                optionSelected += 1;
                PlaySound(sndMenuSelect);
                scale = 0;
                delay = 20;
            }
        }

        if (sysinput_get("right")) {
            with (objMusicManager) {
                global.musicVolume = approach(global.musicVolume, 1, 0.01);
                audio_set_volume(music, global.musicVolume);
            }
        }

        if (sysinput_get("left")) {
            with (objMusicManager) {
                global.musicVolume = approach(global.musicVolume, 0, 0.01);
                audio_set_volume(music, global.musicVolume);
            }
        }
        break;

    // Sounds
    case 2:
        // Change option
        if (sysinput_get("up") && delay == 0) {
            optionSelected -= 1;
            PlaySound(sndMenuSelect);
            scale = 0;
            delay = 20;
        }
        // Change option
        if (sysinput_get("down") && delay == 0) {
            optionSelected += 1;
            PlaySound(sndMenuSelect);
            scale = 0;
            delay = 20;
        }

        if (sysinput_get("right")) {
            global.soundVolume = approach(global.soundVolume, 1, 0.01);
        }

        if (sysinput_get("left")) {
            global.soundVolume = approach(global.soundVolume, 0, 0.01);
        }
        break;

    // Voicelines
    case 3:
        // Change option
        if (sysinput_get("up") && delay == 0) {
            optionSelected -= 1;
            PlaySound(sndMenuSelect);
            scale = 0;
            delay = 20;
        }
        // Change option
        if (sysinput_get("down") && delay == 0) {
            optionSelected += 1;
            PlaySound(sndMenuSelect);
            scale = 0;
            delay = 20;
        }

        if (sysinput_get("right")) {
            global.voiceVolume = approach(global.voiceVolume, 1, 0.01);
        }

        if (sysinput_get("left")) {
            global.voiceVolume = approach(global.voiceVolume, 0, 0.01);
        }
        break;

    // VSync
    case 4:
        // Change option
        if (sysinput_get("up")&& delay == 0) {
            optionSelected -= 1;
            PlaySound(sndMenuSelect);
            scale = 0;
            delay = 20;
        }
        // Change option
        if (sysinput_get("down") && delay == 0) {
            optionSelected += 1;
            PlaySound(sndMenuSelect);
            scale = 0;
            delay = 20;
        }

        if (sysinput_get("right")) {
            set_synchronization(true);
            global.screenVSync = true;
        }

        if (sysinput_get("left")) {
            set_synchronization(false);
            global.screenVSync = false;
        }
        break;

    // Exit and saving
    case optionMax - 1:
        if (delay == 0) {
            if (sysinput_get("up")) {
                optionSelected -= 1;
                PlaySound(sndMenuSelect);
                scale = 0;
                delay = 20;
            }
            // Change option
            if (sysinput_get("down")) {
                optionSelected = 0;
                PlaySound(sndMenuSelect);
                scale = 0;
                delay = 20;
            }

            if (sysinput_get("accept")) {
                PlaySound(sndMenuAccept);
                delay = 120;
                leaved = true;

                // Save configurations
                ini_open("configf.ini");
                ini_write_real("config", "screen", global.screenSize);
                ini_write_real("config", "vsync", global.screenVSync);
                ini_write_real("config", "sfxvolume", global.soundVolume);
                ini_write_real("config", "bgmvolume", global.musicVolume);
                ini_write_real("config", "voicevolume", global.voiceVolume);
                ini_close();

            }
        }
        break;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Exit

if (leaved) {
    image_alpha -= 0.03;

    if (image_alpha < 0) {
        instance_destroy();
    }
    if (instance_exists(objAstralTitle)) {
        with (objAstralTitle) {
            menu = 1;

            menuOption = 1;
            option[0, 0] = finalOptionY[0];
            option[1, 0] = finalOptionY[1];
            option[2, 0] = finalOptionY[2];

            optionMainAlpha = 1;
            cardDashY = option[menuOption, 0] - 2;
            cardYScale = 4;
            cardY = view_yview + ScreenHeight - 120;
            delay = 20;
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw options

draw_sprite_ext(sprTrigger, 0, view_xview, view_yview, ScreenWidth, ScreenHeight, 0, c_blue, image_alpha);

// Draw options
var _volumeMusic, _volumeSound, _volumeVoice, _volumeAmbient;
_volumeMusic = floor(global.musicVolume * 100);
_volumeSound = floor(global.soundVolume * 100);
_volumeVoice = floor(global.voiceVolume * 100);
draw_set_alpha(image_alpha)
var _colorLine;
_colorLine = $e09915;
draw_line_width_color(view_xview, optionY[optionSelected] + 10, view_xview + scale, optionY[optionSelected] + 10, fontSpace, _colorLine, _colorLine);
draw_set_font(fontConsolasBold12)
draw_set_halign(fa_left);

// Draw options
draw_text(optionX[0], view_yview + optionY[0], "Screen Resolution: " + string(window_get_width()) + "X" + string(window_get_height()));
draw_text(optionX[1], view_yview + optionY[1], "Music Volume: " + string(_volumeMusic));
draw_text(optionX[2], view_yview + optionY[2], "Sound Volume: " + string(_volumeSound));
draw_text(optionX[3], view_yview + optionY[3], "Voice Volume: " + string(_volumeVoice));
var _vsync;
if (global.screenVSync) {
    _vsync = "ON";
}
else {
    _vsync = "OFF";
}
draw_text(optionX[4], view_yview + optionY[4], "VSync: " + _vsync);
draw_text(optionX[optionMax - 1], view_yview + optionY[optionMax - 1], "Save and Exit");
draw_set_halign(-1);
draw_set_font(1);
draw_set_alpha(1);
