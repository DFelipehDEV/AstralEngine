#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

hudShakeTimer = 0;
hudShakeOffset = 0;
global.gameTimeAllow = true;

global.gameTime = global.playerCheckTime;

gaugeIndex = 21;

// Button pop up variables
hudButtonKBM = -1;
hudButtonJoystick = -1;
hudButtonTimer = 0;
hudButtonAlpha[0] = 0;
hudButtonAlpha[1] = 1;
hudButtonScale = 5;

hudOffset = 0;

// Flags when the HUD is supossed to dissapear from the screen
hudHide = false;

// Enemy fight HUD
hudEnemy = 0;
hudEnemyFrame = 0;
hudEnemyScale = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause

pauseOption = 1;
pauseOptionOutlineScale = 0;
pauseTimeAllowPrevious = true;

titleScale = 0;

gamescreen = -1;

delay = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HUD Control

switch (hudHide) {
    case false:
        hudOffset = lerp(hudOffset, 0, 0.07);
    break;

    case true:
        hudOffset = lerp(hudOffset, 300, 0.07);
    break;
}

if (hudShakeTimer) {
    hudShakeTimer -= 1;
}

if (!hudEnemy && hudEnemyScale > 0) {
    hudEnemyScale = SmoothStep(hudEnemyScale, 0, 0.25);
}

if (hudEnemy) {
    hudEnemyScale = SmoothStep(hudEnemyScale, 1, 0.25);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Buttons

if (hudButtonKBM != -1) {
    // Check if the button timer is avaiable to show the button
    if (hudButtonTimer > 0) {
        hudButtonTimer -= 1;
        hudButtonAlpha[0] = min(hudButtonAlpha[0] + 0.2, 1);

        // Play warning sound effect
        if (hudButtonAlpha[0] == 0.4) {
            PlaySound("snd/MenuWarn");
        }
        // Decrease button scale
        hudButtonScale = lerp(hudButtonScale, 2, 0.2);
        hudButtonAlpha[1] = lerp(hudButtonAlpha[1], 0, 0.2);
    }
    else {
        hudButtonScale = lerp(hudButtonScale, 0, 0.2);
        hudButtonAlpha[0] = max(hudButtonAlpha[0] - 0.2, 0);


        // Reset variables after dissapearing
        if (hudButtonAlpha[0] == 0) {
            hudButtonKBM = -1;
            hudButtonTimer = 0;
            hudButtonAlpha[0] = 0;
            hudButtonAlpha[1] = 1;
            hudButtonScale = 5;
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
            // Activate pause screen
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

                        if (global.player[0] != noone) {
                            with (global.player[0]) {
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
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Timer

if (global.gameTimeAllow) {
    global.gameTime += 1000 / 60 * global.deltaMultiplier;
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
// Draw ingame HUD
if (global.player[0] != noone && !GameStateGet(GameStatePaused)) {
    // Speedlines
    if (global.player[0].boostInstance != noone) {
        draw_sprite_ext(sprHUDSpeedlines, global.gameTime div 40, _viewX, _viewY, 1, 1, 0, c_white, (global.player[0].boostInstance.image_alpha / 1.8))
    }
    draw_set_font(global.fontHUD);
    draw_set_color(c_white);
    draw_set_halign(fa_right);

    // Draw time
    draw_sprite(sprHUDTime, 0, _viewX - hudOffset, _viewY + 8);
    draw_text((_viewX - hudOffset) + 100, _viewY + 16, string(floor(global.gameTime/60000)) + ":" + StringNumberFormat(floor(global.gameTime/1000) mod 60,2) + ":" + StringNumberFormat(floor(global.gameTime/10) mod 100,2));

    // Draw rings
    draw_set_halign(fa_left);
    draw_sprite(sprHUDRings, 0, (_viewX - hudOffset), _viewY + 32);
    draw_text((_viewX - hudOffset) + 37, _viewY + 40, string(global.playerRings));
    // Red counter
    if (global.playerRings == 0) {
        draw_text_color((_viewX - hudOffset) + 37, _viewY + 40, string(global.playerRings), c_red, c_red, c_red, c_red, min(cos(global.gameTime/200), 1));
    }
    if (global.player[0].combineActive) {
        draw_text_color((_viewX - hudOffset) + 37, _viewY + 40, string(global.playerRings), c_aqua, c_blue, c_blue, c_blue, abs(cos(global.gameTime/300)));
    }
    draw_set_halign(fa_right);

    // Draw energy bar
    gaugeIndex = approach(gaugeIndex, global.player[0].energy/4, 1);
    var shake;
    shake = sin(hudShakeTimer)*3;
    draw_sprite(sprHUDEnergy, 0, (_viewX - hudOffset), (_viewY + ScreenHeight - 40) + shake)
    // Draw gauge
    draw_sprite(sprHUDGauge, floor(gaugeIndex), (_viewX - hudOffset), (_viewY + ScreenHeight - 27) + shake)

    // Check if the enemy scale is more than 0
    if (hudEnemyScale > 0) {
        // Enemy text
        draw_sprite_ext(sprHUDEnemiesText, 0, _viewX + ScreenWidthHalf, _viewY + 16, 1, hudEnemyScale, 0, c_white, 1);
        // Enemies left
        draw_sprite_ext(sprHUDEnemiesCounter, hudEnemyFrame + 1, _viewX + ScreenWidthHalf, _viewY + 30, hudEnemyScale, hudEnemyScale, 0, c_white, 1);
    }

    if (hudButtonKBM != -1) {
        // Keyboard input
        if (!global.gamepad) {
            // Draw input key
            draw_sprite_ext(sprKeyboardKeys, hudButtonKBM, _viewX + ScreenWidthHalf, _viewY + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[0]);

            // Highlight
            if (hudButtonAlpha[1] > 0) {
                // White version
                d3d_set_fog(1, c_white, 0, 0)
                draw_sprite_ext(sprKeyboardKeys, hudButtonKBM, _viewX + ScreenWidthHalf, _viewY + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[1]);
                d3d_set_fog(0, c_white, 0, 0)
            }
        }
        else {
        // Gamepad input
            // Draw input key
            draw_sprite_ext(sprGamepadKeys, hudButtonJoystick, _viewX + ScreenWidthHalf, _viewY + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[0]);

            // Highlight
            if (hudButtonAlpha[1] > 0) {
                // White version
                d3d_set_fog(1, c_white, 0, 0)
                draw_sprite_ext(sprGamepadKeys, hudButtonJoystick, _viewX + ScreenWidthHalf, _viewY + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[1]);
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
            // Draw black outline
            draw_sprite_ext(sprPauseOptions, 3, (_viewX + 3) + ScreenWidthHalf, ((_viewY + 3) - 10) + ScreenHeightHalf, pauseOptionOutlineScale, pauseOptionOutlineScale, 0, c_white, 1);


            // Draw options
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
