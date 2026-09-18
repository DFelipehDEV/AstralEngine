#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
image_speed = 0.2;
shift = 0;
initialY = ystart;

cardDashX = 0;
cardDashY = view_yview + ScreenHeight - 75;

cardXScale = ScreenWidth;
cardYScale = 1;

cardX = view_xview;
cardY = view_yview + ScreenHeight - 75;
cardTargetY = view_yview + ScreenHeight - 150;

// Cache initial room background positions so room editor edits are preserved
var i;
for (i = 0; i < 8; i += 1) {
    bgStartX[i] = background_x[i];
    bgStartY[i] = background_y[i];
}

menu = 0;

echoAlpha = 0;
echoScale = 1;

menuTimer = 0;

titleOffset = 0;
startAlpha = 1;

optionSelected = 0;

inputDelay = 0;
returnDelay = 0;

optionMax = 4;
optionSpacing = 32;
currentBaseY = ScreenHeight + 48;
targetBaseY = cardTargetY + 8;

optionLabel[0] = "New Game";
optionLabel[1] = "Continue";
optionLabel[2] = "Settings";
optionLabel[3] = "Quit the game";

optionMainAlpha = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu Management
switch (menu) {
    // Press start menu
    case 0:
        returnDelay -= 1;

        if (sysinput_get_pressed("accept") && returnDelay < 0) {
            menu = 1;
            echoAlpha = 1;
            PlaySound(sndMenuAccept);
        }
        break;

    // After press start menu
    case 1:
        menuTimer += 1;
        echoAlpha = max(echoAlpha - 0.05, 0);

        if (echoAlpha > 0) {
            echoScale += 0.05;
        }

        // Animations
        if (menuTimer < 80) {
            startAlpha -= 0.1;

            titleOffset = lerp(titleOffset, 120, 0.04);

            background_x[1] = bgStartX[1] + titleOffset;
            background_y[1] = bgStartY[1] + titleOffset;

            background_x[2] = bgStartX[2] - titleOffset;
            background_y[2] = bgStartY[2] - titleOffset;

            background_x[3] = bgStartX[3] - titleOffset;
            background_y[3] = bgStartY[3] + titleOffset;

            background_x[4] = bgStartX[4] + titleOffset;
            background_y[4] = bgStartY[4] - titleOffset;

            ystart = lerp(ystart, initialY - 24, 0.08);

            cardYScale = lerp(cardYScale, 4, 0.05);
            cardY = approach(cardY, cardTargetY, 2);
        }

        // Selection phase
        if (menuTimer > 60) {
            inputDelay = max(inputDelay - 1, 0);

            currentBaseY = lerp(currentBaseY, targetBaseY, 0.1);
            var _selectedY;
            _selectedY = currentBaseY + (optionSelected * optionSpacing);

            cardDashY = lerp(cardDashY, _selectedY - 3, 0.1);

            if (inputDelay == 0) {
                // Navigation
                if (sysinput_get("up")) {
                    optionSelected = (optionSelected - 1 + optionMax) mod optionMax;
                    inputDelay = 15;
                    PlaySound(sndMenuSelect);
                }
                if (sysinput_get("down")) {
                    optionSelected = (optionSelected + 1) mod optionMax;
                    inputDelay = 15;
                    PlaySound(sndMenuSelect);
                }

                // Confirmation
                if (sysinput_get_pressed("accept")) {
                    switch (optionSelected) {
                        case 0: // Start
                            if (!instance_exists(objFadeRoom)) {
                                TransitionFadeNext(c_white);
                                PlaySound(sndMenuAccept);
                            }
                            break;

                        case 1: // Continue
                            if (!instance_exists(objFadeRoom)) {
                                if (LoadGame()) {
                                    var _nextRoom, _targetRoom;
                                    _nextRoom = SaveGetValue("NextRoom");
                                    _targetRoom = -1;

                                    if (is_string(_nextRoom) && _nextRoom != "") {
                                        _targetRoom = room_find(_nextRoom);
                                    } else if (is_real(_nextRoom) && _nextRoom != -1) {
                                        _targetRoom = _nextRoom;
                                    }

                                    if (_targetRoom == room) {
                                        _targetRoom = room_next(room);
                                    }

                                    if (room_exists(_targetRoom)) {
                                        TransitionFadeRoom(_targetRoom, c_white);
                                        PlaySound(sndMenuAccept);
                                    }
                                }
                            }
                            break;

                        case 2: // Options
                            menu = 3;
                            PlaySound(sndMenuAccept);
                            break;

                        case 3: // Exit
                            game_end();
                            break;
                    }
                }
            }
        }
        break;

    // Options menu
    case 3:
        cardY = max(cardY - 4, view_yview - 200);
        cardYScale = min(cardYScale + 1, 30);
        optionMainAlpha = max(optionMainAlpha - 0.07, 0);

        if (!instance_exists(objSettingsMenu)) {
            instance_create(x, y, objSettingsMenu);
        }
        break;

    // Returning from options menu
    case 4:
        optionMainAlpha = 1;
        cardYScale = 4;
        cardY = cardTargetY;

        currentBaseY = targetBaseY;
        cardDashY = (currentBaseY + optionSelected * optionSpacing) - 3;

        if (!instance_exists(objSettingsMenu)) {
            menu = 1;
            inputDelay = 15;
        }
        break;
}

// Background animation
shift += 2;
y = ystart - dsin(shift) * 2;

// Dash sign movement
cardDashX += 6;

if (cardDashX > ScreenWidth + sprite_get_width(sprTitleCardDash)) {
    cardDashX = -sprite_get_width(sprTitleCardDash);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
draw_self();

// Glow
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, (sin(current_time/1700)*0.35)*image_alpha);
draw_set_blend_mode(bm_normal)

// Card
var _barH;
if (menu >= 1) _barH = max(round(39 * cardYScale), ScreenHeight - cardY);
else _barH = round(39 * cardYScale);
DrawBar(cardX, cardY, cardXScale, _barH);

// Dash sign
draw_sprite_ext(sprTitleCardDash, 0, cardDashX, cardDashY, 1, 1, 0, ColorPrimaryLight, 1);

// Press start text
draw_sprite_ext(sprPressStart, 0, ScreenWidthHalf, 10 + ScreenHeight - 65, 1, 1, 0, c_white, startAlpha);

// Selected press start text echo
draw_sprite_ext(sprPressStart, 0, ScreenWidthHalf, 10 + ScreenHeight - 65, echoScale, echoScale, 0, c_gray, echoAlpha);

if (menu == 1 || menu == 2) {
    var _selectedY;
    _selectedY = currentBaseY + optionSelected * optionSpacing;

    // Option highlight background
    draw_rect(0, _selectedY, ScreenWidth, 36, ColorPrimaryDark, optionMainAlpha * 0.6);

    // Dash sign
    draw_sprite_ext(sprTitleCardDash, 0, cardDashX, cardDashY, 1, 1, 0, ColorPrimaryLight, 1);

    draw_set_alpha(optionMainAlpha)
    draw_set_font(fontImpact24)
    draw_set_halign(fa_center);
    var i;
    for (i = 0; i < optionMax; i += 1) {
        var _optY;
        _optY = currentBaseY + i * optionSpacing;
        draw_text(ScreenWidthHalf, _optY, optionLabel[i]);
    }
    draw_set_halign(-1);
    draw_set_font(1)
    draw_set_alpha(1)
}
