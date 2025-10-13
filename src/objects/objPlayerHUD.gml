#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
DeactivateExceptionsAdd(id);

hidden = false;
shakeTimer = 0;
shakeOffset = 0;

gaugeIndex = 21;

// Button pop up variables
buttonAction = "";
lastButtonAction = buttonAction;
buttonAlpha[0] = 0;
buttonAlpha[1] = 1;
buttonScale = 5;

offset = 0;

// Enemy fight HUD
enemy = 0;
enemyFrame = 0;
enemyScale = 0;
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
/// HUD Control
if (hidden) {
    offset = lerp(offset, 300, 0.07);
} else {
    offset = lerp(offset, 0, 0.07);
}

if (shakeTimer) {
    shakeTimer -= 1;
}

if (!enemy && enemyScale > 0) {
    enemyScale = lerp(enemyScale, 0, 0.2);
}

if (enemy) {
    enemyScale = lerp(enemyScale, 1, 0.2);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Buttons
if (buttonAction != "") {
    buttonAlpha[0] = min(buttonAlpha[0] + 0.2, 1);
    buttonScale = lerp(buttonScale, 2, 0.2);
    buttonAlpha[1] = lerp(buttonAlpha[1], 0, 0.2);
    lastButtonAction = buttonAction;
} else {
    buttonScale = lerp(buttonScale, 0, 0.2);
    buttonAlpha[0] = max(buttonAlpha[0] - 0.2, 0);

    if (buttonAlpha[0] == 0) {
        buttonAlpha[1] = 1;
        buttonScale = 5;
    }
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
if (instance_exists(player) && !GameStateGet(GameStatePaused)) {
    BeginUI();
    // Speedlines
    if (instance_exists(player.boostAura)) {
        draw_sprite_ext(sprHUDSpeedlines, global.gameTime div 40, 0, 0, 1, 1, 0, c_white, (player.boostAura.image_alpha / 1.8))
    }
    draw_set_font(global.fontHUD);
    draw_set_color(c_white);
    draw_set_halign(fa_right);

    var _leftHUDX;
    _leftHUDX = 16 - offset;

    // Time
    draw_sprite(sprHUDTime, 0, _leftHUDX, 8);
    draw_text(_leftHUDX + 95, 16, string_pad(floor(global.gameTime/60000), 2) + ":" + string_pad(floor(global.gameTime/1000) mod 60,2) + ":" + string_pad(floor(global.gameTime/10) mod 100,2));

    // Rings
    draw_set_halign(fa_left);
    draw_sprite(sprHUDRings, 0, _leftHUDX, 32);
    draw_text(_leftHUDX + 20, 40, string(global.playerRings));
    // Red fade on ring counter
    if (global.playerRings == 0) {
        draw_text_color(_leftHUDX + 20, 40, string(global.playerRings), c_red, c_red, c_red, c_red, min(cos(global.gameTime/200), 1));
    }
    if (player.combineActive) {
        draw_text_color(_leftHUDX + 20, 40, string(global.playerRings), c_aqua, c_blue, c_blue, c_blue, abs(cos(global.gameTime/300)));
    }
    draw_set_halign(fa_right);

    // Energy bar
    gaugeIndex = approach(gaugeIndex, player.energy/4, 1);
    var shake;
    shake = sin(shakeTimer)*3;
    draw_sprite(sprHUDEnergy, 0, _leftHUDX, (ScreenHeight - 40) + shake)
    draw_sprite(sprHUDGauge, floor(gaugeIndex), _leftHUDX - 8, (ScreenHeight - 27) + shake)

    // Check if the enemy scale is more than 0
    if (enemyScale > 0) {
        // Enemy text
        draw_sprite_ext(sprHUDEnemiesText, 0, ScreenWidthHalf, 16, 1, enemyScale, 0, c_white, 1);
        // Enemies left
        draw_sprite_ext(sprHUDEnemiesCounter, enemyFrame, ScreenWidthHalf, 30, enemyScale, enemyScale, 0, c_white, 1);
    }

    if (buttonAlpha[0] > 0) {
        InputIconDraw(lastButtonAction, ScreenWidthHalf, 64, buttonScale, buttonScale, 0, c_white, buttonAlpha[0]);

        // Highlight
        if (buttonAlpha[1] > 0) {
            d3d_set_fog(1, c_white, 0, 0)
            InputIconDraw(buttonAction, ScreenWidthHalf, 64, buttonScale, buttonScale, 0, c_white, buttonAlpha[1]);
            d3d_set_fog(0, c_white, 0, 0)
        }
    }
    EndUI();
}
