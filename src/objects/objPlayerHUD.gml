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
buttonKey = -1;
buttonGamepad = -1;
buttonTimer = 0;
buttonAlpha[0] = 0;
buttonAlpha[1] = 1;
buttonScale = 5;

offset = 0;

// Enemy fight HUD
enemy = 0;
enemyFrame = 0;
enemyScale = 0;

pauseOption = 1;
pauseOptionOutlineScale = 0;
pauseTimeAllowPrevious = true;

titleScale = 0;

gamescreen = -1;

delay = 0;
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
    enemyScale = SmoothStep(enemyScale, 0, 0.25);
}

if (enemy) {
    enemyScale = SmoothStep(enemyScale, 1, 0.25);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Buttons

if (buttonKey != -1) {
    if (buttonTimer > 0) {
        buttonTimer -= 1;
        buttonAlpha[0] = min(buttonAlpha[0] + 0.2, 1);

        if (buttonAlpha[0] == 0.4) {
            PlaySound("snd/MenuWarn");
        }

        buttonScale = lerp(buttonScale, 2, 0.2);
        buttonAlpha[1] = lerp(buttonAlpha[1], 0, 0.2);
    }
    else {
        buttonScale = lerp(buttonScale, 0, 0.2);
        buttonAlpha[0] = max(buttonAlpha[0] - 0.2, 0);


        // Reset variables after dissapearing
        if (buttonAlpha[0] == 0) {
            buttonKey = -1;
            buttonTimer = 0;
            buttonAlpha[0] = 0;
            buttonAlpha[1] = 1;
            buttonScale = 5;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Game State

delay = max(delay - 1, 0)

switch (GameStateGet(GameStatePaused)) {
    case GameStateRunning:
        if (InputGet(InputStartPressed, 0)) {
            pauseTimeAllowPrevious = global.gameTimeAllow;
            global.gameTimeAllow = false;
            // Free the previous print screen
            if (gamescreen != -1) {
                background_delete(gamescreen);
            }
            // Create a "print screen" of the screen before pausing
            gamescreen = background_create_from_screen(0, 0, ScreenWidth, ScreenHeight, 0, 0);

            // Stop all objects
            instance_deactivate_all(1)
            instance_activate_object(objControllerInput);
            instance_activate_object(objControllerMusic);
            instance_activate_object(objControllerRoom);

            with (music) {
                fadeOut = true;
            }

            GameStateSet(GameStatePaused);
        }

        if (titleScale > 0) {
            titleScale = lerp(titleScale, 0, 0.2);;
        }
        break;

    case GameStatePaused:
        titleScale = lerp(titleScale, 1, 0.2);

        switch (pauseOption) {
            case 1:
                pauseOptionOutlineScale = lerp(pauseOptionOutlineScale, 1, 0.2);
                if (delay == 0) {
                    // Restart option
                    if (InputGet(InputDown, 0)) {
                        delay = 20;
                        pauseOption = 2;
                        pauseOptionOutlineScale = 0;
                    }

                    // Continue
                    if (InputGet(InputAction)) {
                        delay = 20;
                        // Activate all objects
                        instance_activate_all();

                        // Remove pause screen
                        GameStateSet(GameStateRunning);
                        global.gameTimeAllow = pauseTimeAllowPrevious;

                        if (ownerID != noone) {
                            with (ownerID) {
                                if (allowKeysTimer < 15) {
                                    allowKeysTimer = 15;
                                }
                            }
                        }
                        with (music) {
                            fadeOut = false;
                            fadeIn = true;
                        }
                    }
                }
                break;

            case 2:
                pauseOptionOutlineScale = lerp(pauseOptionOutlineScale, 1, 0.2);
                if (delay == 0) {
                    // Continue option
                    if (InputGet(InputUp, 0)) {
                        delay = 20;
                        pauseOption = 1;
                        pauseOptionOutlineScale = 0;
                    }


                    // Exit option
                    if (InputGet(InputDown, 0)) {
                        delay = 20;
                        pauseOption = 3;
                        pauseOptionOutlineScale = 0;
                    }

                    // Restart
                    if (InputGet(InputAction)) {
                        delay = 20;
                        GameStateSet(GameStateRunning);
                        instance_activate_all()
                        with (instance_create(0, 0, objFadeRoom)) {
                            roomgo = room;
                        }
                        PlayerGlobalsReset();
                    }
                }
                break;

            case 3:
                pauseOptionOutlineScale = lerp(pauseOptionOutlineScale, 1, 0.2);
                if (delay == 0) {
                    // Restart option
                    if (InputGet(InputUp, 0)) {
                        delay = 20;
                        pauseOption = 2;
                        pauseOptionOutlineScale = 0;
                    }

                    // Exit
                    if (InputGet(InputAction)) {
                        GameStateSet(GameStateRunning);
                        delay = 20;
                        instance_activate_all()
                        with (instance_create(0, 0, objFadeRoom)) {
                            roomgo = rmTitleScreen;
                        }
                        PlayerGlobalsReset();
                    }
                }
                break;
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

var _viewX, _viewY;
_viewX = view_xview[0];
_viewY = view_yview[0];

d3d_set_projection_ortho(_viewX, _viewY, ScreenWidth, ScreenHeight, 0) // Stop HUD from resizing

if (ownerID != noone && instance_exists(ownerID) && !GameStateGet(GameStatePaused)) {
    // Speedlines
    if (ownerID.boostInstance != noone) {
        draw_sprite_ext(sprHUDSpeedlines, global.gameTime div 40, _viewX, _viewY, 1, 1, 0, c_white, (ownerID.boostInstance.image_alpha / 1.8))
    }
    draw_set_font(global.fontHUD);
    draw_set_color(c_white);
    draw_set_halign(fa_right);

    // Time
    draw_sprite(sprHUDTime, 0, _viewX - offset, _viewY + 8);
    draw_text((_viewX - offset) + 100, _viewY + 16, string(floor(global.gameTime/60000)) + ":" + StringNumberFormat(floor(global.gameTime/1000) mod 60,2) + ":" + StringNumberFormat(floor(global.gameTime/10) mod 100,2));

    // Rings
    draw_set_halign(fa_left);
    draw_sprite(sprHUDRings, 0, (_viewX - offset), _viewY + 32);
    draw_text((_viewX - offset) + 37, _viewY + 40, string(global.playerRings));
    // Red fade on ring counter
    if (global.playerRings == 0) {
        draw_text_color((_viewX - offset) + 37, _viewY + 40, string(global.playerRings), c_red, c_red, c_red, c_red, min(cos(global.gameTime/200), 1));
    }
    if (ownerID.combineActive) {
        draw_text_color((_viewX - offset) + 37, _viewY + 40, string(global.playerRings), c_aqua, c_blue, c_blue, c_blue, abs(cos(global.gameTime/300)));
    }
    draw_set_halign(fa_right);

    // Energy bar
    gaugeIndex = approach(gaugeIndex, ownerID.energy/4, 1);
    var shake;
    shake = sin(shakeTimer)*3;
    draw_sprite(sprHUDEnergy, 0, (_viewX - offset), (_viewY + ScreenHeight - 40) + shake)
    draw_sprite(sprHUDGauge, floor(gaugeIndex), (_viewX - offset), (_viewY + ScreenHeight - 27) + shake)

    // Check if the enemy scale is more than 0
    if (enemyScale > 0) {
        // Enemy text
        draw_sprite_ext(sprHUDEnemiesText, 0, _viewX + ScreenWidthHalf, _viewY + 16, 1, enemyScale, 0, c_white, 1);
        // Enemies left
        draw_sprite_ext(sprHUDEnemiesCounter, enemyFrame + 1, _viewX + ScreenWidthHalf, _viewY + 30, enemyScale, enemyScale, 0, c_white, 1);
    }

    if (buttonKey != -1) {
        // Keyboard input
        if (!global.gamepad) {
            // Draw input key
            draw_sprite_ext(sprKeyboardKeys, buttonKey, _viewX + ScreenWidthHalf, _viewY + 64, buttonScale, buttonScale, 0, c_white, buttonAlpha[0]);

            // Highlight
            if (buttonAlpha[1] > 0) {
                // White version
                d3d_set_fog(1, c_white, 0, 0)
                draw_sprite_ext(sprKeyboardKeys, buttonKey, _viewX + ScreenWidthHalf, _viewY + 64, buttonScale, buttonScale, 0, c_white, buttonAlpha[1]);
                d3d_set_fog(0, c_white, 0, 0)
            }
        }
        else {
        // Gamepad input
            // Draw input key
            draw_sprite_ext(sprGamepadKeys, buttonGamepad, _viewX + ScreenWidthHalf, _viewY + 64, buttonScale, buttonScale, 0, c_white, buttonAlpha[0]);

            // Highlight
            if (buttonAlpha[1] > 0) {
                // White version
                d3d_set_fog(1, c_white, 0, 0)
                draw_sprite_ext(sprGamepadKeys, buttonGamepad, _viewX + ScreenWidthHalf, _viewY + 64, buttonScale, buttonScale, 0, c_white, buttonAlpha[1]);
                d3d_set_fog(0, c_white, 0, 0)
            }
        }
    }
}

// Draw pause screen
if (GameStateGet(GameStatePaused) && gamescreen != -1) {
    draw_background_ext(gamescreen, _viewX, _viewY, 1, 1, 0, c_gray, 1)

    switch (pauseOption) {
        case 1:
            // Outline
            draw_sprite_ext(sprPauseOptions, 3, (_viewX + 3) + ScreenWidthHalf, ((_viewY + 3) - 10) + ScreenHeightHalf, pauseOptionOutlineScale, pauseOptionOutlineScale, 0, c_white, 1);

            // Options
            draw_sprite_ext(sprPauseOptions, 0, _viewX + ScreenWidthHalf, (_viewY - 10) + ScreenHeightHalf, titleScale, titleScale, 0, c_white, 1);
            draw_sprite_ext(sprPauseOptions, 1, _viewX + ScreenWidthHalf, (_viewY + 10) + ScreenHeightHalf, titleScale, titleScale, 0, c_gray, 1);
            draw_sprite_ext(sprPauseOptions, 2, _viewX + ScreenWidthHalf, (_viewY + 30) + ScreenHeightHalf, titleScale, titleScale, 0, c_gray, 1);
        break;

        case 2:
            draw_sprite_ext(sprPauseOptions, 3, (_viewX + 3) + ScreenWidthHalf, ((_viewY + 3) + 10) + ScreenHeightHalf, pauseOptionOutlineScale, pauseOptionOutlineScale, 0, c_white, 1);

            // Draw options
            draw_sprite_ext(sprPauseOptions, 0, _viewX + ScreenWidthHalf, (_viewY - 10) + ScreenHeightHalf, titleScale, titleScale, 0, c_gray, 1);
            draw_sprite_ext(sprPauseOptions, 1, _viewX + ScreenWidthHalf, (_viewY + 10) + ScreenHeightHalf, titleScale, titleScale, 0, c_white, 1);
            draw_sprite_ext(sprPauseOptions, 2, _viewX + ScreenWidthHalf, (_viewY + 30) + ScreenHeightHalf, titleScale, titleScale, 0, c_gray, 1);
        break;

        case 3:
            // Draw black outline
            draw_sprite_ext(sprPauseOptions, 3, (_viewX + 3) + ScreenWidthHalf, ((_viewY + 3) + 30) + ScreenHeightHalf, pauseOptionOutlineScale, pauseOptionOutlineScale, 0, c_white, 1);

            // Draw options
            draw_sprite_ext(sprPauseOptions, 0, _viewX + ScreenWidthHalf, (_viewY - 10) + ScreenHeightHalf, titleScale, titleScale, 0, c_gray, 1);
            draw_sprite_ext(sprPauseOptions, 1, _viewX + ScreenWidthHalf, (_viewY + 10) + ScreenHeightHalf, titleScale, titleScale, 0, c_gray, 1);
            draw_sprite_ext(sprPauseOptions, 2, _viewX + ScreenWidthHalf, (_viewY + 30) + ScreenHeightHalf, titleScale, titleScale, 0, c_white, 1);
        break;
    }
}
draw_sprite_ext(sprPauseTitle, 0, _viewX + ScreenWidthHalf, (_viewY - 40) + ScreenHeightHalf, round(titleScale/0.2)*0.2, round(titleScale/0.2)*0.2, 0, c_white, 1);
