#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();

hidden = false;
shakeTimer = 0;
shakeOffset = 0;

gaugeIndex = 21;

offset = 0;

buttonPopup = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HUD Control
if (hidden) {
    offset = lerp(offset, 300, 0.07);
} else {
    offset = lerp(offset, 0, 0.07);
}

if (shakeTimer) {
    shakeTimer -= 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Game State
switch (GameStateGet()) {
    case GameStateRunning:
        if (sysinput_get_pressed("pause")) {
            instance_create(x, y, objPauseMenu);
            GameStateSet(GameStatePaused);
        }
        break;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw HUD
if (instance_exists(player) && GameStateGet() != GameStatePaused) {
    BeginUI();
    // Speedlines
    if (instance_exists(player.boostAura)) {
        draw_sprite_ext(sprHUDSpeedlines, World.gameTime div 40, 0, 0, 1, 1, 0, c_white, (player.boostAura.image_alpha / 1.8))
    }
    draw_set_font(global.fontHUD);
    draw_set_color(c_white);
    draw_set_halign(fa_right);

    var _leftHUDX;
    _leftHUDX = 16 - offset;

    // Time
    draw_sprite(sprHUDTime, 0, _leftHUDX, 8);
    draw_text(_leftHUDX + 95, 16, string_pad(floor(World.gameTime/60000), 2) + ":" + string_pad(floor(World.gameTime/1000) mod 60,2) + ":" + string_pad(floor(World.gameTime/10) mod 100,2));

    // Rings
    var _rings;
    _rings = string(player.rings);
    draw_set_halign(fa_left);
    draw_sprite(sprHUDRings, 0, _leftHUDX, 32);
    draw_text(_leftHUDX + 20, 40, _rings);
    // Red fade on ring counter
    if (player.rings == 0) {
        draw_text_color(_leftHUDX + 20, 40, _rings, c_red, c_red, c_red, c_red, min(cos(World.gameTime/200), 1));
    }

    if (player.combineActive) {
        draw_text_color(_leftHUDX + 20, 40, _rings, c_aqua, c_blue, c_blue, c_blue, abs(cos(World.gameTime/300)));
    }

    draw_set_halign(fa_right);

    // Energy bar
    gaugeIndex = approach(gaugeIndex, player.energy/4, 1);
    var shake;
    shake = sin(shakeTimer)*3;
    draw_sprite(sprHUDEnergy, 0, _leftHUDX, (ScreenHeight - 40) + shake)
    draw_sprite(sprHUDGauge, floor(gaugeIndex), _leftHUDX - 8, (ScreenHeight - 27) + shake)

    EndUI();
}
