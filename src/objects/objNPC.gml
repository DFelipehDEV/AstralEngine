#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
dialogues = ds_list_create();
dialogueQuerier = noone;

inputAlpha = 0;

player = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Change dialogue and end dialogue
if (!instance_exists(dialogueQuerier) && instance_exists(player)) {
    player.allowKeys = true;
    player.hud.hidden = false;

    player.cam.yShift = 0;
    player.cam.target = player;
    player = noone;
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dialogue
if (other.keyLightspeedPressed && !instance_exists(dialogueQuerier)) {
    player = other.id;
    with (player) {
        allowKeys = false;
        PlayerResetKeys();

        xSpeed = 0;

        cam.yShift = -50;
        cam.target = other.id;
        hud.hidden = true;
    }

    dialogueQuerier = instance_create(x, y, objDialogueQuery);
    dialogueQuerier.dialogues = dialogues;
}
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
