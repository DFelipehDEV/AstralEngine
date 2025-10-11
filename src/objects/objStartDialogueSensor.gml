#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
dialogues = ds_list_create();
dialogueQuerier = noone;

player = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Play
if (instance_exists(dialogueQuerier)) {
    exit;
} else if (instance_exists(player)) {
    player.allowKeys = true;
    player = noone;
    instance_destroy();
}

player = instance_place(x, y, objPlayer);
if (player != noone) {
    dialogueQuerier = instance_create(x, y, objDialogueQuery);
    dialogueQuerier.dialogues = dialogues;
    with (player) {
        allowKeys = false;
        PlayerResetKeys();
    }
}
