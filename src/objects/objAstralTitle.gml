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
targetBaseY = ScreenHeight - 128;

optionLabel[0] = "New game";
optionLabel[1] = "Continue";
optionLabel[2] = "Settings";
optionLabel[3] = "Exit game";

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

            ystart = lerp(ystart, initialY - 24, 0.08);

            cardYScale = lerp(cardYScale, 4, 0.05);
            cardY = approach(cardY, view_yview + ScreenHeight - 136, 2);
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
                                    var _previousRoom;
                                    _previousRoom = SaveGetValue("PreviousRoom");
                                    TransitionFadeRoom(room_next(room_find(_previousRoom)), c_white);
                                    PlaySound(sndMenuAccept);
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

        if (!instance_exists(objAstralSettings)) {
            instance_create(x, y, objAstralSettings);
        }
    break;

    // Returning from options menu
    case 4:
        optionMainAlpha = 1;
        cardYScale = 4;
        cardY = view_yview + ScreenHeight - 136;

        currentBaseY = targetBaseY;
        cardDashY = (currentBaseY + optionSelected * optionSpacing) - 3;

        if (!instance_exists(objAstralSettings)) {
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
// Earth
draw_sprite_ext(sprAstralTitleBG, 0, titleOffset, titleOffset, 1, 1, 0, image_blend, 1);

// Moon
draw_sprite_ext(sprAstralTitleBG, 1, -titleOffset, -titleOffset, 1, 1, 0, image_blend, 1);

// Logo
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Glow
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, (sin(current_time/1700)*0.35)*image_alpha);
draw_set_blend_mode(bm_normal)

// Card
draw_sprite_ext(sprTitleCardZoneCard, 0, cardX, cardY, cardXScale, cardYScale, 0, image_blend, 1);

// Dash sign
draw_sprite_ext(sprTitleCardDash, 0, cardDashX, cardDashY, 1, 1, 0, image_blend, 1);

// Press start text
draw_sprite_ext(sprPressStart, 0, ScreenWidthHalf, 10 + ScreenHeight - 65, 1, 1, 0, c_white, startAlpha);

// Selected press start text echo
draw_sprite_ext(sprPressStart, 0, ScreenWidthHalf, 10 + ScreenHeight - 65, echoScale, echoScale, 0, c_gray, echoAlpha);

// Shape bottom
draw_sprite_ext(sprAstralTitleBG, 2, -titleOffset, titleOffset, 1, 1, 0, image_blend, 1);

// Shape top
draw_sprite_ext(sprAstralTitleBG, 3, titleOffset, -titleOffset, 1, 1, 0, image_blend, 1);

if (menu == 1 || menu == 2) {
    var _selectedY;
    _selectedY = currentBaseY + optionSelected * optionSpacing;

    // Option highlight background
    draw_rect(0, _selectedY, ScreenWidth, 36, merge_color(c_black, ColorPrimary, 0.025), optionMainAlpha * 0.6);

    // Dash sign
    draw_sprite_ext(sprTitleCardDash, 0, cardDashX, cardDashY, 1, 1, 0, image_blend, 1);

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
