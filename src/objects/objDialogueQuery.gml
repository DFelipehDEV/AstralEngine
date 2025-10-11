#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
dialogues = ds_map_create();

currentDialogue = 0;
currentDialogueInstance = noone;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create dialogues
if (!instance_exists(currentDialogueInstance)) {
    var _dial;
    _dial = ds_list_find_value(dialogues, currentDialogue);

    if (_dial == 0) {
        instance_destroy_id(currentDialogueInstance);
        instance_destroy();
        exit;
    }
    var _text, _avatar, _avatarIndex, _color;
    _text = ds_map_find_value(_dial, "text");
    _avatar = ds_map_find_value(_dial, "avatar");
    _avatarIndex = ds_map_find_value(_dial, "avatarIndex");
    _color = ds_map_find_value(_dial, "color");

    currentDialogueInstance = instance_create(x, y, objDialogue);
    with (currentDialogueInstance) {
        text = _text;
        avatar = _avatar;
        avatarIndex = _avatarIndex;
        color = _color;
    }

    currentDialogue += 1;
}
