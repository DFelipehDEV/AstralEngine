#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

optionSpacing = 1.2;

option = 0;

options[0, 0] = 0; // image_index
options[0, 1] = c_white; // image_blend
options[0, 2] = 0; // y

options[1, 0] = 1;
options[1, 1] = c_gray;
options[1, 2] = sprite_get_height(sprPauseOptions) * 1 * optionSpacing;

options[2, 0] = 2;
options[2, 1] = c_gray;
options[2, 2] = sprite_get_height(sprPauseOptions) * 2 * optionSpacing;

options[3, 0] = 3;
options[3, 1] = c_gray;
options[3, 2] = sprite_get_height(sprPauseOptions) * 3 * optionSpacing;

settings = noone;

pauseOptionOutlineScale = 0;
pauseTimeAllowPrevious = true;

titleScale = 0;

gamescreen = -1;

delay = 20;

pauseTimeAllowPrevious = global.gameTimeAllow;
global.gameTimeAllow = false;

// Create a "print screen" of the screen before pausing
background = background_create_from_screen(0, 0, ScreenWidth, ScreenHeight, 0, 0);

// Stop all objects
instance_deactivate_all(1)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy bg

if (background != -1) {
    background_delete(background);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Options

delay = max(delay - 1, 0);

switch (GameStateGet()) {
    case GameStateRunning:
        titleScale = lerp(titleScale, 0, 0.2);
        if (titleScale < 0.2) {
            global.gameTimeAllow = pauseTimeAllowPrevious;
            instance_activate_all();
            instance_destroy();
        }
        break;

    case GameStatePaused:
        titleScale = lerp(titleScale, 1, 0.2);
        pauseOptionOutlineScale = lerp(pauseOptionOutlineScale, 1, 0.2);

        if (delay > 0 || instance_exists(settings)) break;

        if (sysinput_get("up") && option > 0) {
            options[option, 1] = c_gray;
            option -= 1;
            options[option, 1] = c_white;
            delay = 20;
            pauseOptionOutlineScale = 0;
            PlaySound(sndMenuSelect);
        }
        if (sysinput_get("down") && option < 3) {
            options[option, 1] = c_gray;
            option += 1;
            options[option, 1] = c_white;
            delay = 20;
            pauseOptionOutlineScale = 0;
            PlaySound(sndMenuSelect);
        }

        if (sysinput_get_pressed("accept")) {
            delay = 20;

            switch (option) {
                case 0:
                    GameStateSet(GameStateRunning);
                    instance_activate_all();
                    break;

                case 1:
                    with (instance_create(0, 0, objFadeRoom)) {
                        roomTarget = room;
                    }
                    PlayerResetGlobalVariables();
                    break;

                case 2:
                    settings = instance_create(x, y, objAstralSettings);
                    break;

                case 3:
                    with (instance_create(0, 0, objFadeRoom)) {
                        roomTarget = rmTitleScreen;
                    }
                    PlayerResetGlobalVariables();
                    break;
            }
            PlaySound(sndMenuAccept);
        }

        break;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw options

var _viewX, _viewY;
_viewX = view_xview[0];
_viewY = view_yview[0];

if (background != -1) {
    draw_background_ext(background, _viewX, _viewY, 1, 1, 0, c_gray, 1)
}

draw_sprite_ext(sprite_index, 0, _viewX + ScreenWidthHalf, (_viewY + ScreenHeightHalf) - sprite_height, round(titleScale/0.2)*0.2, round(titleScale/0.2)*0.2, 0, c_white, 1);

draw_sprite_ext(sprPauseOptions, 4, (_viewX + ScreenWidthHalf) + 3, (_viewY + ScreenHeightHalf) + options[option, 2] + 3, pauseOptionOutlineScale, pauseOptionOutlineScale, 0, c_white, 1);

var i;
for (i = 0; i < 4; i += 1) {
    draw_sprite_ext(sprPauseOptions, i, _viewX + ScreenWidthHalf, (_viewY + ScreenHeightHalf) + options[i, 2], titleScale, titleScale, 0, options[i, 1], 1);
}
