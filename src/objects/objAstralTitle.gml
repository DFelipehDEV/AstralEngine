#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
DeactivateExceptionsAdd(id);
image_speed = 0.2;
shift = 0;

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

menuOption = 0;

delay = 0;
returnDelay = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu variables
var _baseY, _spacing;
_baseY = ScreenHeight + 48;
_spacing = 1.3;

option[0, 0] = _baseY + 32;
option[0, 1] = "START";
option[1, 0] = _baseY + 64;
option[1, 1] = "SETTINGS";
option[2, 0] = _baseY + 128;
option[2, 1] = "EXIT";

finalOptionY[0] = _baseY - 112 * _spacing;
finalOptionY[1] = _baseY - 88 * _spacing;
finalOptionY[2] = _baseY - 64 * _spacing;

optionMainAlpha = 1;
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
/// Management
switch (menu) {
    // Press start menu
    case 0:
        returnDelay -= 1;
        // Check if the player has pressed the start button
        if (InputGet(InputActionPressed, 0) && returnDelay < 0) {
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

        // Start animations
        if (menuTimer < 80) {
            startAlpha -= 0.1;
            // Make hud elements go away
            titleOffset = lerp(titleOffset, 120, 0.04);

            image_xscale = lerp(image_xscale, 0.75, 0.1);
            image_yscale = image_xscale;
            cardYScale = lerp(cardYScale, 4, 0.05);
            cardY = approach(cardY, view_yview + ScreenHeight - 96, 2);
        }

        // Selection
        if (menuTimer > 60) {
            delay = max(delay - 1, 0);

            option[0, 0] = lerp(option[0, 0], finalOptionY[0], 0.1);
            option[1, 0] = lerp(option[1, 0], finalOptionY[1], 0.1);
            option[2, 0] = lerp(option[2, 0], finalOptionY[2], 0.1);

            cardDashY = lerp(cardDashY, option[menuOption, 0] - 2, 0.1);

            if (delay == 0) {
                switch (menuOption) {
                    // Start option
                    case 0:
                        // Change selection
                        if (InputGet(InputDown, 0)) {
                            menuOption += 1;
                            delay = 25;

                            PlaySound(sndMenuSelect);
                        }
                        // Check if the player has pressed the start button
                        if InputGet(InputActionPressed, 0) && !instance_exists(objFadeNext) {
                            with (instance_create(0, 0, objFadeNext)) {
                                color = c_white;
                            }
                            PlaySound(sndMenuAccept);
                        }
                        break;

                    // Options option
                    case 1:
                        // Change selection
                        if (InputGet(InputUpPressed, 0) != 0) {
                            menuOption -= 1;
                            delay = 25;
                            PlaySound(sndMenuSelect);
                        }
                        // Change selection
                        if (InputGet(InputDown, 0)) {
                            menuOption += 1;
                            delay = 25;
                            PlaySound(sndMenuSelect);
                        }

                        // Go to options menu
                        if (InputGet(InputAction, 0)) {
                            menu = 3;
                            PlaySound(sndMenuAccept);
                        }
                        break;

                    // Exit option
                    case 2:
                        // Change selection
                        if (InputGet(InputUp, 0)) {
                            menuOption -= 1;
                            delay = 25;
                            PlaySound(sndMenuSelect);
                        }

                        // Check if the player has pressed the start button
                        if (InputGet(InputAction, 0)) {
                            game_end();
                        }
                        break;
                }
            }
        }
    break;

    // Options menu
    case 3:
        cardY -= 4;
        cardYScale += 1;
        optionMainAlpha -= 0.07;

        if (!instance_exists(objAstralOptions)) {
            instance_create(x, y, objAstralOptions)
        }
        break;
}

// Move up and down
shift += 2;
y = ystart - dsin(shift)*2;

// Dash sign position
cardDashX += 6;

// Back to the start if it has reached the screen limit
if (cardDashX > (ScreenWidth) + sprite_get_width(sprTitleCardDash)) {
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
draw_sprite_ext(sprAstralTitleBG, 0, view_xview + titleOffset, view_yview + titleOffset, 1, 1, 0, image_blend, 1);

// Moon
draw_sprite_ext(sprAstralTitleBG, 1, view_xview - titleOffset, view_yview - titleOffset, 1, 1, 0, image_blend, 1);

// Card
draw_sprite_ext(sprTitleCardZoneCard, 0, cardX, cardY, cardXScale, cardYScale, 0, image_blend, 1);

// Dash sign
draw_sprite_ext(sprTitleCardDash, 0, view_xview + cardDashX, cardDashY, 1, 1, 0, image_blend, 1);

// Press start text
draw_sprite_ext(sprPressStart, 0, view_xview+ ScreenWidthHalf, view_yview + 10 + ScreenHeight - 65, 1, 1, 0, c_white, startAlpha);

// Selected press start text echo
draw_sprite_ext(sprPressStart, 0, view_xview + ScreenWidthHalf, view_yview + 10 + ScreenHeight - 65, echoScale, echoScale, 0, c_gray, echoAlpha);

// Shape bottom
draw_sprite_ext(sprAstralTitleBG, 2, view_xview - titleOffset, view_yview + titleOffset, 1, 1, 0, image_blend, 1);

// Shape top
draw_sprite_ext(sprAstralTitleBG, 3, view_xview + titleOffset, view_yview - titleOffset, 1, 1, 0, image_blend, 1);

// Logo
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Glow
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, (sin(current_time/1700)*0.35)*image_alpha);
draw_set_blend_mode(bm_normal)

if (menu == 1 || menu == 2) {
    // Card
    draw_sprite_ext(sprTitleCardZoneCard, 0, 0, option[menuOption, 0], ScreenWidth, 0.9, 0, $d2cd6e, 1);

    // Dash sign
    draw_sprite_ext(sprTitleCardDash, 0, view_xview + cardDashX, cardDashY, 1, 1, 0, image_blend, 1);

    draw_set_alpha(optionMainAlpha)
    draw_set_font(fontImpact24)
    draw_set_halign(fa_center);
    var i;
    for (i = 0; i < 3; i += 1) {
        draw_text(ScreenWidthHalf, option[i, 0], option[i, 1]);
    }
    draw_set_halign(-1);
    draw_set_font(1)
    draw_set_alpha(1)
}
