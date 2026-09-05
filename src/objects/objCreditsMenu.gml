#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Setup
MarkAsActive();

image_alpha = 0;
closing = false;
scrollY = 0;

creditsText =
    "ASTRAL ENGINE" +
    "#Created by DFelipehDEV" +
    "#" +
    "#Technologies used:" +
    "#  GameMaker 8.1 by Mark Overmars, YoYo Games" +
    "#  GameMaker 8.2 by 8.2 Project and contributors" +
    "#  gm82core by renex and contributors" +
    "#  gm82audio by renex and contributors" +
    "#  gm82buf by renex and contributors" +
    "#  gm82dx9 by renex and contributors" +
    "#  gm82test by renex and contributors" +
    "#  gm82joy by renex and contributors" +
    "#  gm82save by renex, Floogle" +
    "#  sysInput by DFelipehDEV" +
    "#" +
    "#Additional Art:" +
    "#  FieryExplosion" +
    "#  Gussprint" +
    "#" +
    "#Additional Programming:" +
    "#  damizean" +
    "#  Chaos Rush" +
    "#" +
    "#Sonic the Hedgehog (C) SEGA / Sonic Team";

draw_set_font(fontSans);
maxScrollY = max(0, string_height_ext(creditsText, -1, ScreenWidth - 64) - (ScreenHeight - 60));
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Logic & Input
if (closing) {
    image_alpha -= 0.1;
    if (image_alpha <= 0) instance_destroy();
    exit;
}

image_alpha = approach(image_alpha, 1, 0.1);

if (sysinput_get_pressed("cancel")) {
    PlaySound(sndMenuSelect);
    closing = true;
    exit;
}

if (sysinput_get("up"))   scrollY = max(0, scrollY - 3);
if (sysinput_get("down")) scrollY = min(maxScrollY, scrollY + 3);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Credits
BeginUI();

draw_set_alpha(image_alpha);
draw_rect(0, 0, ScreenWidth, ScreenHeight, c_black, 0.85);

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fontSans);

draw_text_ext(ScreenWidthHalf, 36 - scrollY, creditsText, -1, ScreenWidth - 64);

draw_set_halign(fa_left);
draw_set_font(-1);
draw_set_alpha(1);

InputIconDraw("cancel", 16, ScreenHeight - 16, 1, 1);
draw_text(32, ScreenHeight - 24, "Exit");

EndUI();
