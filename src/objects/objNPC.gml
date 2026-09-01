#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
dialogues = dss_list_create();
dialogueQuerier = noone;

inputAlpha = 0;

player = noone;
playerCam = noone;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dispatch
NPCDispatch();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change dialogue and end dialogue
if (!instance_exists(dialogueQuerier) && instance_exists(player)) {
    player.allowKeys = true;
    if (instance_exists(player.hud)) player.hud.hidden = false;

    if (instance_exists(playerCam)) {
        playerCam.yShift = 0;
        playerCam.target = player;
    }
    playerCam = noone;
    player = noone;
}

// Interaction check
if (!instance_exists(dialogueQuerier) && instance_exists(objPlayer)) {
    var _nearPlayer;
    _nearPlayer = instance_nearest(x, y, objPlayer);
    if (instance_exists(_nearPlayer) && distance_to_object(_nearPlayer) < 20) {
        if (_nearPlayer.keyLightspeedPressed) {
            player = _nearPlayer;
            playerCam = _nearPlayer.cam;

            with (player) {
                allowKeys = false;
                PlayerResetKeys();
                xSpeed = 0;
                if (instance_exists(hud)) hud.hidden = true;
            }

            if (instance_exists(playerCam)) {
                playerCam.yShift = -50;
                playerCam.target = id;
            }

            dialogueQuerier = instance_create(x, y, objDialogueQuery);
            dialogueQuerier.dialogues = dialogues;
        }
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dispatch
NPCDispatch();
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw input tip
if (inputAlpha > 0) {
    InputIconDraw("npc_interact", x, bbox_top - 16, inputAlpha, inputAlpha);
}

var _talking;
_talking = instance_exists(dialogueQuerier);

// Check if the player is touching the navigator
if (distance_to_object(objPlayer) < 20 && !_talking) {
    inputAlpha = lerp(inputAlpha, 1, 0.2);
}
if (distance_to_object(objPlayer) >= 20 || _talking) {
    inputAlpha = lerp(inputAlpha, 0, 0.2);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw NPC
draw_self();

event_user(0);
