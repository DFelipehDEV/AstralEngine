#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
image_speed = 0;

text = "insert text here";
currentText = ""; // Text in progress of being written
textYOffset = -12;
textFont = global.fontText;
currentCharacter = 0;

avatar = sprNoone;
avatarIndex = 0;

color = c_white;
PlaySound(sndDialogueOpen);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Write the text
textYOffset = approach(textYOffset, 0, 1);

if (currentCharacter < string_length(text) + 1) {
    var _characterToInsert;
    _characterToInsert = string_char_at(text, currentCharacter);
    currentText = string_insert(_characterToInsert, currentText, currentCharacter);
    if (currentCharacter mod 4 == 0) {
        PlaySound(sndDialogueType, 1, 1, false, true);
    }
    currentCharacter += 1;
}

if (sysinput_get_pressed("dialogue_skip")) {
    if (currentCharacter < string_length(text)) {
        currentCharacter = string_length(text);
        currentText = text;
    } else {
        instance_destroy();
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
BeginUI();

draw_set_valign(fa_top)
draw_set_font(textFont);
draw_sprite_ext(sprite_index, image_index, 16, 70, image_xscale, image_yscale, image_angle, color, image_alpha);

InputIconDraw("dialogue_skip", 157, 168, 1, 1);

draw_sprite_ext(avatar, avatarIndex, 28, 177, image_xscale, image_yscale, image_angle, c_white, image_alpha);

draw_set_alpha(image_alpha);
draw_set_halign(fa_left);
draw_text_ext(32, 183 + textYOffset, currentText, 16, 350);
draw_set_alpha(1);

EndUI();
