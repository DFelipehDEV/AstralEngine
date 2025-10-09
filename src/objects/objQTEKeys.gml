#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
image_alpha = 0;

qteTimer = 0;
qteWon = 0;

hudBackScale = 0;

hudInput[1] = choose(0, 1, 2);
hudInput[2] = choose(0, 1, 2);
hudInput[3] = choose(0, 1, 2);
hudInputCounter = 0;
hudInputScale[1] = 0;
hudInputScale[2] = 0;
hudInputScale[3] = 0;
hudTimerColor = make_color_rgb(0, 115, 255);
hudTimer = 100;

player = noone;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsAdd(id);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

qteTimer += 1;

if (qteTimer < 60) exit;
if (qteWon == 0) {
    //Lets not talk about this
    if (hudTimer > -100) {
        //HUD animations
        image_alpha = min(image_alpha + 0.05, 0.8)
        if (image_alpha >= 0.7) {
            hudBackScale = min(hudBackScale + 0.05, 1);

            if (hudBackScale > 0.95) {
                hudInputScale[1] = min(hudInputScale[1] + 0.2, 1)
                hudInputScale[2] = min(hudInputScale[2] + 0.2, 1)
                hudInputScale[3] = min(hudInputScale[3] + 0.2, 1)
                hudTimer -= 2.8;
            }
        }
    }
    else {
        //The player has failed the quick time event

        image_alpha = max(image_alpha - 0.1, 0)
        hudBackScale = max(hudBackScale - 0.2, 0)
        global.timeScale = min(global.timeScale + 0.2, 1)

        if (!audio_isplaying(sndPlayerHurt)) {
            PlaySound(sndPlayerHurt);
        }
        if (image_alpha <= 0.1) {
            with (player) {
                StatesSet(PlayerStateHomingFlight);
                xSpeed = other.failedXSpeed;
                ySpeed = other.failedYSpeed;
                allowKeysTimer = 50;
            }
            instance_destroy();
        }
    }
}
else {
    image_alpha = max(image_alpha - 0.1, 0)
    hudBackScale = max(hudBackScale - 0.2, 0)
    global.timeScale = min(global.timeScale + 0.2, 1)

    if (image_alpha == 0) {
        instance_destroy();
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

var _inputActionPressed, _inputSpecial1Pressed, _inputSpecial2Pressed;
_inputActionPressed = sysinput_get_pressed("qte_1");
_inputSpecial1Pressed = sysinput_get_pressed("qte_2");
_inputSpecial2Pressed = sysinput_get_pressed("qte_3");

// Check if we haven't won the event yet
if (qteWon == 0 && image_alpha > 0.7) {
    // Which input you are currently on
    switch (hudInputCounter) {
        case 0:
            switch (hudInput[1]) {
                //In case you have to press A 
                case 0:
                    if (_inputActionPressed) {
                        hudInputCounter += 1;
                        PlaySound(sndQTEPress);
                    }
                    break;
                
                
                //In case you have to press S 
                case 1:
                    if (_inputSpecial1Pressed) {
                        hudInputCounter += 1;
                        PlaySound(sndQTEPress);
                    }
                    break;
                
                
                //In case you have to press D 
                case 2:
                    if (_inputSpecial2Pressed) {
                        hudInputCounter += 1;
                        PlaySound(sndQTEPress);
                    }
                    break;
                    
            }
            break;
        
        case 1:
            hudInputScale[1] = max(hudInputScale[1] - 0.3, 0)
            switch (hudInput[2]) {
                //In case you have to press A 
                case 0:
                    if (_inputActionPressed) {
                        hudInputCounter += 1;
                        PlaySound(sndQTEPress);
                    }
                    break;
                
                
                //In case you have to press S 
                case 1:
                    if (_inputSpecial1Pressed) {
                        hudInputCounter += 1;
                        PlaySound(sndQTEPress);
                    }
                    break;
                
                
                //In case you have to press D 
                case 2:
                    if (_inputSpecial2Pressed) {
                        hudInputCounter += 1;
                        PlaySound(sndQTEPress);
                    }
                    break;
                    
            }
            break;
        
        
        //Win the event here
        case 2:        
            hudInputScale[1] = max(hudInputScale[1] - 0.4, 0)
            hudInputScale[2] = max(hudInputScale[2] - 0.4, 0)        
            switch (hudInput[3]) {
                //In case you have to press A 
                case 0:
                    if (_inputActionPressed) {
                        hudInputCounter += 1;
                        PlaySound(sndQTEPress);
                        qteWon = 1;
                        PlaySound(sndQTEWin);
                        
                        with (player) {
                            StatesSet(PlayerStateHomingFlight);
                            AnimationApply("HOMED");
                            allowKeysTimer = 60;
                        }
                        PlayVoice(player.voiceline[8]);
                        hudInputScale[3] = 0.5;
                    }
                    break;
                
                
                //In case you have to press S 
                case 1:
                    if (_inputSpecial1Pressed) {
                        hudInputCounter += 1;
                        PlaySound(sndQTEPress);
                        qteWon = 1;
                        PlaySound(sndQTEWin);
                        
                        with (player) {
                            StatesSet(PlayerStateHomingFlight);
                            AnimationApply("HOMED");
                            allowKeysTimer = 60;
                        }
                        PlayVoice(player.voiceline[8]);
                        hudInputScale[3] = 0.5;
                    }
                    break;
                
                
                //In case you have to press D 
                case 2:
                    if (_inputSpecial2Pressed) {
                        hudInputCounter += 1;
                        PlaySound(sndQTEPress);
                        qteWon = 1;
                        PlaySound(sndQTEWin);
                        
                        with (player) {
                            StatesSet(PlayerStateHomingFlight);
                            AnimationApply("HOMED");
                            allowKeysTimer = 60;
                        }
                        PlayVoice(player.voiceline[8]);
                        hudInputScale[3] = 0.5;
                    }
                    break;
                    
            }
            break;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
var _viewX, _viewY;
_viewX = view_xview[0];
_viewY = view_yview[0];

d3d_set_projection_ortho(_viewX, _viewY, ScreenWidth, ScreenHeight, 0) // Stop HUD from resizing
// Draw underlay
draw_set_alpha(image_alpha);
draw_rectangle_color(_viewX, _viewY, _viewX + ScreenWidth, _viewY + ScreenHeight, c_black, c_black, c_black, c_black, 0);

draw_sprite_ext(sprQTEKeysBack, 0, _viewX + ScreenWidthHalf, (_viewY + ScreenHeightHalf) - 30, hudBackScale, hudBackScale, 0, c_white, image_alpha);
draw_rectangle_color((_viewX + ScreenWidthHalf) - 100, (_viewY + ScreenHeightHalf) - 11, (_viewX + ScreenWidthHalf) + hudTimer, (_viewY + ScreenHeightHalf) + 11, hudTimerColor, hudTimerColor, hudTimerColor, hudTimerColor, 0)
draw_set_alpha(1);
draw_sprite_ext(sprQTETimer, 0, _viewX + ScreenWidthHalf, (_viewY + ScreenHeightHalf), hudBackScale, hudBackScale, 0, c_white, image_alpha);

var _controller;
_controller = joystick_exists(0);
for (i = 0; i < 3; i += 1) {
    switch(hudInput[i + 1]) {
        case 0:
            if (!_controller) {
                draw_sprite_ext(sprKeyboardKeys, 0, (_viewX - (24 - i*24)) + ScreenWidthHalf, (_viewY + ScreenHeightHalf) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
            } else {
                draw_sprite_ext(sprGamepadKeys, 0, (_viewX - (24 - i*24)) + ScreenWidthHalf, (_viewY + ScreenHeightHalf) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
            }
            break;

        case 1:
            if (!_controller) {
                draw_sprite_ext(sprKeyboardKeys, 18, (_viewX - (24 - i*24)) + ScreenWidthHalf, (_viewY + ScreenHeightHalf) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
            } else {
                draw_sprite_ext(sprGamepadKeys, 2, (_viewX - (24 - i*24)) + ScreenWidthHalf, (_viewY + ScreenHeightHalf) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
            }
            break;

        case 2:
            if (!_controller) {
                draw_sprite_ext(sprKeyboardKeys, 3, (_viewX - (24 - i*24)) + ScreenWidthHalf, (_viewY + ScreenHeightHalf) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
            } else {
                draw_sprite_ext(sprGamepadKeys, 1, (_viewX - (24 - i*24)) + ScreenWidthHalf, (_viewY + ScreenHeightHalf) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
            }
            break;
    }
}
