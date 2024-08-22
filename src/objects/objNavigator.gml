#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dialogue and NPC Variables

// Dialogue-related variables
dialogueAlpha = 0;
dialogueColor = c_white;
dialogueOffsetX = 400;
dialogueOffsetY = 400;
drawOffsetY = 0;

// NPC chat variables
ended = 0;
npcChatting = false;

// Text and string handling
letter = 1;
letterSoundTimer = 0;
npcString = "NO TEXT";
npcStringLength = 0;
npcStringCurrent = 0;
textOffset = 0;
textTotal = "";

// Avatar settings
avatarSprite = sprDialogueAvatarNavigator;
avatarIndex = 0; // Avatar Image Index

// Input related variables
inputAlpha = 0;

ownerID = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change dialogue and end dialogue

switch (ended) {
    // In case the dialogue has not ended
    case 0:
        if InputGet(InputActionPressed, 0) && npcChatting {
            // Check if its not in the final dialogue
            if (npcStringCurrent < npcStringLength - 1) {
                // Next Dialogue
                npcStringCurrent = min((npcStringCurrent + 1), (npcStringLength - 1));
                textTotal = "";
                letter = 1;
                PlaySound("sndDialogueOpen");
                textOffset = -12;
            }
            else {
                // Finish dialogue
                ended = 1;
            }
        }
    break;

    // In case the dialogue has ended
    case 1:
        npcChatting = false;
        npcStringCurrent = 0;
        letter = 1;
        textTotal = "";

        // Return to previous state
        ownerID.allowKeys = true;
        objControllerStage.hudHide = false;

        ownerID.cam.camYShift = 0;
        ownerID.cam.camTarget = objPlayer;
        ownerID = noone;
        ended = 0;
    break;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Show dialogue

if (npcChatting) {
    if (dialogueAlpha < 1) {
        dialogueAlpha += 0.05;
    }

    dialogueOffsetX = lerp(dialogueOffsetX, 0, 0.12);
    dialogueOffsetY = lerp(dialogueOffsetY, 0, 0.12);

    textOffset = min(textOffset + 1, 0)
}
else {
    dialogueAlpha = 0;
    dialogueOffsetX = lerp(dialogueOffsetX, 400, 0.13);
    dialogueOffsetY = lerp(dialogueOffsetY, 400, 0.13);
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dialogue

// Check if we are not in a dialogue
if (!npcChatting) {
    // Check if we pressed the input to start talking
    if (InputGet(InputSpecial3Pressed, 0)) {
        ownerID = other.id;
        npcChatting = true;

        npcStringCurrent = 0;
        with (ownerID) {
            xSpeed = 0;
            allowKeys = false;
            keyLeft = 0;
            keyRight = 0;
            keyUp = 0;
            keyDown = 0;
            keyAction = 0;
            keySpecial1 = 0;
            keySpecial2 = 0;
            keySpecial3 = 0;

            keyLeftPressed = 0;
            keyRightPressed = 0;
            keyUpPressed= 0;
            keyDownPressed = 0;
            keyActionPressed = 0;
            keySpecial1Pressed = 0;
            keySpecial2Pressed = 0;
            keySpecial3Pressed = 0;
        }


        ownerID.cam.camYShift = -50;
        ownerID.cam.camTarget = id;
        PlaySound("sndDialogueOpen");

        objControllerStage.hudHide = true;
        ended = 0;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw NPC

draw_sprite_ext(sprite_index, 2, x, y, max(0.6, abs(cos(global.gameTime/230)*1.4)), max(0.3, abs(cos(global.gameTime/200)*1.3)), image_angle, image_blend, image_alpha)
draw_sprite_ext(sprite_index, 1, x - 1, y, image_xscale, image_yscale, round((global.gameTime/8)/6)*6, image_blend, image_alpha);

if (inputAlpha > 0) {
    // Check if there is no gamepad connected
    if (!global.gamepad) {
        // Draw keyboard input
        draw_sprite_ext(sprKeyboardKeys, 5, x, bbox_top - 16, inputAlpha, inputAlpha, 0, image_blend, inputAlpha);
    }
    else {
        // Draw gamepad input
        draw_sprite_ext(sprGamepadKeys, 3, x, bbox_top - 16, inputAlpha, inputAlpha, 0, image_blend, inputAlpha);
    }
}

// Check if the player is touching the navigator
if (distance_to_object(objPlayer) < 40 && !npcChatting) {
    inputAlpha = lerp(inputAlpha, 1, 0.2);
}
if (distance_to_object(objPlayer) >= 40 || npcChatting) {
    inputAlpha = lerp(inputAlpha, 0, 0.2);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Dialogue

// Dialogue
if (npcChatting) {
    if (dialogueAlpha == 1) {
        letterSoundTimer = max(0, letterSoundTimer - 1);
        // Write dialogue text
        var _lettertofind;
        if (letter < string_length(npcString[npcStringCurrent]) + 1) {
            _lettertofind = string_char_at(npcString[npcStringCurrent], letter)
            textTotal = string_insert(_lettertofind, string(textTotal), letter)
            if (letterSoundTimer == 0) {
                sound_stop("sndDialogueType")
                PlaySound("sndDialogueType", global.volumeSounds, 1, false)
                letterSoundTimer = 4;
            }
        }
        letter += 1;
    }
    draw_set_valign(fa_top)
    draw_set_font(global.fontText);
    draw_sprite_ext(sprDialogueBG, 0, view_xview[0] + 16 - dialogueOffsetX, view_yview[0] + 70 - dialogueOffsetY, 1, 1, 0, dialogueColor[npcStringCurrent], dialogueAlpha);
    if (!global.gamepad) {
        draw_sprite_ext(sprKeyboardKeys, 0, view_xview[0] + 157 - dialogueOffsetX, view_yview[0] + 168 - dialogueOffsetY, 1, 1, 0, c_white, dialogueAlpha);
    }
    else {
        draw_sprite_ext(sprGamepadKeys, 0, view_xview[0] + 157 - dialogueOffsetX, view_yview[0] + 168 - dialogueOffsetY, 1, 1, 0, c_white, dialogueAlpha);
    }
    draw_sprite_ext(avatarSprite[npcStringCurrent], avatarIndex[npcStringCurrent], view_xview[0] + 28 - dialogueOffsetX, view_yview[0] + 177 - dialogueOffsetY, 1, 1, 0, c_white, dialogueAlpha);

    draw_set_alpha(dialogueAlpha);
    draw_set_halign(fa_left);
    draw_text_ext(view_xview[0] + 32 - dialogueOffsetX, view_yview[0] + (183 + textOffset) - dialogueOffsetY, string(textTotal), 3, 600);
    draw_set_alpha(1);
}
