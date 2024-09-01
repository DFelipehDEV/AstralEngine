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

optionMax = 7;
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
            if InputGet(InputDown, 0) {
                optionSelected += 1;
                PlaySound("snd/MenuSelect");
                scale = 0;
                delay = 20;
            }

            if (InputGet(InputRight, 0)) {
                with (objControllerRoom) {
                    global.screenSize += 1;
                    event_user(0);
                }
                delay = 25;
            }

            if (InputGet(InputLeft, 0) && global.screenSize > 1) {
                with (objControllerRoom) {
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
            if (InputGet(InputUp, 0) && delay == 0) {
                optionSelected -= 1;
                PlaySound("snd/MenuSelect");
                scale = 0;
                delay = 20;
            }

            // Change option
            if (InputGet(InputDown, 0)) {
                optionSelected += 1;
                PlaySound("snd/MenuSelect");
                scale = 0;
                delay = 20;
            }
        }

        if (InputGet(InputRight, 0)) {
            with (objMusicManager) {
                global.musicVolume = approach(global.musicVolume, 1, 0.01);
                musicVolumeReal = global.musicVolume;
                sound_volume(objMusicManager.music, global.musicVolume)
            }
        }

        if (InputGet(InputLeft, 0)) {
            with (objMusicManager) {
                global.musicVolume = approach(global.musicVolume, 0, 0.01);
                musicVolumeReal = global.musicVolume;
                sound_volume(objMusicManager.music, global.musicVolume)
            }
        }
        break;

    // Sounds
    case 2:
        // Change option
        if (InputGet(InputUp, 0) && delay == 0) {
            optionSelected -= 1;
            PlaySound("snd/MenuSelect");
            scale = 0;
            delay = 20;
        }
        // Change option
        if (InputGet(InputDown, 0) && delay == 0) {
            optionSelected += 1;
            PlaySound("snd/MenuSelect");
            scale = 0;
            delay = 20;
        }

        if (InputGet(InputRight, 0)) {
            global.soundVolume = approach(global.soundVolume, 1, 0.01);
        }

        if (InputGet(InputLeft, 0)) {
            global.soundVolume = approach(global.soundVolume, 0, 0.01);
        }
        break;

    // Voicelines
    case 3:
        // Change option
        if ((InputGet(InputUp, 0)) && delay == 0) {
            optionSelected -= 1;
            PlaySound("snd/MenuSelect");
            scale = 0;
            delay = 20;
        }
        // Change option
        if ((InputGet(InputDown, 0)) && delay == 0) {
            optionSelected += 1;
            PlaySound("snd/MenuSelect");
            scale = 0;
            delay = 20;
        }

        if (InputGet(InputRight, 0)) {
            global.voiceVolume = approach(global.voiceVolume, 1, 0.01);
        }

        if (InputGet(InputLeft, 0)) {
            global.voiceVolume = approach(global.voiceVolume, 0, 0.01);
        }
        break;

    // Ambient
    case 4:
        // Change option
        if ((InputGet(InputUp, 0)) && delay == 0) {
            optionSelected -= 1;
            PlaySound("snd/MenuSelect");
            scale = 0;
            delay = 20;
        }
        // Change option
        if ((InputGet(InputDown, 0)) && delay == 0) {
            optionSelected += 1;
            PlaySound("snd/MenuSelect");
            scale = 0;
            delay = 20;
        }

        if (InputGet(InputRight, 0)) {
            global.ambientVolume = approach(global.ambientVolume, 1, 0.01);
        }

        if (InputGet(InputLeft, 0)) {
            global.ambientVolume = approach(global.ambientVolume, 0, 0.01);
        }
        break;

    // VSync
    case 5:
        // Change option
        if ((InputGet(InputUp, 0))&& delay == 0) {
            optionSelected -= 1;
            PlaySound("snd/MenuSelect");
            scale = 0;
            delay = 20;
        }
        // Change option
        if ((InputGet(InputDown, 0)) && delay == 0) {
            optionSelected += 1;
            PlaySound("snd/MenuSelect");
            scale = 0;
            delay = 20;
        }

        if (InputGet(InputRight, 0)) {
            set_synchronization(true);
            global.screenVSync = true;
        }

        if (InputGet(InputLeft, 0)) {
            set_synchronization(false);
            global.screenVSync = false;
        }
        break;

    // Exit and saving
    case optionMax - 1:
        if (delay == 0) {
            if (InputGet(InputUp, 0)) {
                optionSelected -= 1;
                PlaySound("snd/MenuSelect");
                scale = 0;
                delay = 20;
            }
            // Change option
            if (InputGet(InputDown, 0)) {
                optionSelected = 0;
                PlaySound("snd/MenuSelect");
                scale = 0;
                delay = 20;
            }

            if (InputGet(InputAction)) {
                PlaySound("snd/MenuAccept");
                delay = 120;
                leaved = true;

                // Save configurations
                ini_open("configf.ini");
                ini_write_real("config", "screen", global.screenSize);
                ini_write_real("config", "vsync", global.screenVSync);
                ini_write_real("config", "sfxvolume", global.soundVolume);
                ini_write_real("config", "bgmvolume", global.musicVolume);
                ini_write_real("config", "voicevolume", global.voiceVolume);
                ini_write_real("config", "ambientvolume", global.ambientVolume);
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
            shift= 0;

            cardDashX= 0;
            cardDashY= view_yview + ScreenHeight - 75;


            // Go to the center of the room
            x = room_width / 2;
            y = room_height / 2;

            cardXScale = ScreenWidth;
            cardYScale = 1;

            cardX = view_xview;
            cardY = view_yview + ScreenHeight - 75;

            menu = 0;

            echoAlpha = 0;
            echoScale = 1;

            menuTimer = 0;

            titleOffset = 0;
            titleNameScale = 1;
            titleY = y;
            startAlpha = 1;

            menuOption = 1;

            delay = 0;
            logoAlpha = 1;
            returnDelay = 50;
            optionY[0] = ScreenHeight;
            optionY[1] = ScreenHeight + 32;
            optionY[2] = ScreenHeight + 64;

            optionMainAlpha = 1;
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
_volumeAmbient = floor(global.ambientVolume * 100);
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
draw_text(optionX[4], view_yview + optionY[4], "Ambient Volume: " + string(_volumeAmbient));
var _vsync;
if (global.screenVSync) {
    _vsync = "ON";
}
else {
    _vsync = "OFF";
}
draw_text(optionX[5], view_yview + optionY[5], "VSync: " + _vsync);
draw_text(optionX[optionMax - 1], view_yview + optionY[optionMax - 1], "Save and Exit");
draw_set_halign(-1);
draw_set_font(1);
draw_set_alpha(1);
