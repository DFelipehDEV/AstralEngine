#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
fontSpace = 24;
image_alpha = 0;
slideX = -400;
padding = 32;

optionMax = 7;

optionLabel[0] = "Fullscreen";
optionType[0] = 0;

optionLabel[1] = "Resolution";
optionType[1] = 1;

optionLabel[2] = "Music Volume";
optionType[2] = 2;

optionLabel[3] = "Sound Volume";
optionType[3] = 3;

optionLabel[4] = "Voice Volume";
optionType[4] = 4;

optionLabel[5] = "VSync";
optionType[5] = 5;

optionLabel[6] = "Save and Exit";
optionType[6] = 6;

optionSelected = 0;
scale = 0;
inputDelay = 0;
leaved = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Exit & Logic
var _type;

if (leaved) {
    image_alpha -= 0.03;
    if (image_alpha <= 0) instance_destroy();
    exit;
}

image_alpha = approach(image_alpha, 0.9, 0.05);
scale = approach(scale, ScreenWidth, 10);
slideX = lerp(slideX, padding, 0.2);
inputDelay = max(inputDelay - 1, 0);

if (inputDelay == 0) {
    if (sysinput_get("up")) {
        optionSelected = (optionSelected - 1 + optionMax) mod optionMax;
        PlaySound(sndMenuSelect);
        scale = 0;
        inputDelay = 15;
    }
    if (sysinput_get("down")) {
        optionSelected = (optionSelected + 1) mod optionMax;
        PlaySound(sndMenuSelect);
        scale = 0;
        inputDelay = 15;
    }

    _type = optionType[optionSelected];

    switch (_type) {
        case 0: // Fullscreen
            if (sysinput_get("right") && !window_get_fullscreen()) { global.windowScale = WindowSetScale(4); inputDelay = 20; }
            if (sysinput_get("left") && window_get_fullscreen()) { global.windowScale = WindowSetScale(1); inputDelay = 20; }
            break;
        case 1: // Resolution
            if (sysinput_get("right")) { global.windowScale = WindowSetScale(global.windowScale + 1); inputDelay = 20; }
            break;

        case 2: // Music Volume
            if (sysinput_get("right")) { global.musicVolume = clamp(global.musicVolume + 0.05, 0, 1); audio_music_volume(global.musicVolume); inputDelay = 10; }
            if (sysinput_get("left"))  { global.musicVolume = clamp(global.musicVolume - 0.05, 0, 1); audio_music_volume(global.musicVolume); inputDelay = 10; }
            break;

        case 3: // Sound Volume
            if (sysinput_get("right")) { global.soundVolume = approach(global.soundVolume, 1, 0.05); inputDelay = 10; };
            if (sysinput_get("left"))  { global.soundVolume = approach(global.soundVolume, 0, 0.05); inputDelay = 10; };
            break;

        case 4: // Voice Volume
            if (sysinput_get("right")) { global.voiceVolume = approach(global.voiceVolume, 1, 0.05); inputDelay = 10; };
            if (sysinput_get("left"))  { global.voiceVolume = approach(global.voiceVolume, 0, 0.05); inputDelay = 10; };
            break;

        case 5: // VSync
            if (sysinput_get("right") && !global.windowVSync) { global.windowVSync = true;  set_synchronization(true);  inputDelay = 20; }
            if (sysinput_get("left")  &&  global.windowVSync) { global.windowVSync = false; set_synchronization(false); inputDelay = 20; }
            break;

        case 6: // Save and Exit
            if (sysinput_get("accept")) {
                PlaySound(sndMenuAccept);
                SettingsSave();
                leaved = true;
                inputDelay = 120;
                if (instance_exists(objAstralTitle)) {
                    objAstralTitle.menu = 4;
                }
            }
            break;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw options
var i, _sliderWidth, _sliderHeight, _valueX;
_sliderWidth = 138;
_sliderHeight = 16;
_valueX = view_wview[view_current] - (padding * 2);

BeginUI();
draw_set_alpha(image_alpha);
draw_set_valign(fa_middle);
draw_rect(0, 0, ScreenWidth, ScreenHeight, c_black, 0.3);

var _selectedY;
_selectedY = fontSpace * (optionSelected + 1);
draw_line_width_color(
    0,     _selectedY,
    scale, _selectedY,
    fontSpace, ColorPrimary, ColorPrimary
);

var _yPos, _type, _optionLabel, _valueText;
for (i = 0; i < optionMax; i += 1) {
    _yPos = fontSpace * (i + 1);
    _optionLabel = string_upper(optionLabel[i]);
    _type = optionType[i];
    _valueText = "";
    _isToggle = (_type == 0 || _type == 1 || _type == 5);

    if (_type == 0) _valueText = pick(window_get_fullscreen(), "OFF", "ON");
    else if (_type == 1) _valueText = string(window_get_width()) + "x" + string(window_get_height());
    else if (_type == 5) _valueText = pick(global.windowVSync, "OFF", "ON");

    if (i == optionSelected && _isToggle) {
        _valueText = "< " + _valueText + " >";
    }

    draw_set_font(fontSansBold);

    draw_set_halign(fa_left);
    draw_text(round(slideX), round(_yPos), _optionLabel);

    draw_set_halign(fa_right);
    draw_set_font(fontSans);

    if (_isToggle) {
        draw_text(round(slideX + _valueX), round(_yPos), _valueText);
    } else if (_type >= 2 && _type <= 4) {
        var _val, _sx, _sy, _thumbX;
        if (_type == 2) _val = global.musicVolume;
        else if (_type == 3) _val = global.soundVolume;
        else if (_type == 4) _val = global.voiceVolume;

        _sx = round((slideX + _valueX) - _sliderWidth);
        _sy = round(_yPos - (_sliderHeight / 2));
        _valueText = string(round(_val * 100)) + "%";

        // Percentage
        draw_text(_sx - 8, round(_yPos), _valueText);

        DrawSlider(_sx, _yPos, _sliderWidth, _sliderHeight, _val, ColorSecondary);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
draw_set_alpha(1);
EndUI();
