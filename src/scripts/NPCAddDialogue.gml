/// NPCAddDialogue(text, color, avatar, avatarIndex)
var _text, _color, _sprite, _frame;
_text = argument0;
_color = argument1;
_avatar = argument2;
_avatarIndex = argument3;

dial = ds_map_create();
ds_map_add(dial, "text", _text);
ds_map_add(dial, "color", _color);
ds_map_add(dial, "avatar", _avatar);
ds_map_add(dial, "avatarIndex", _avatarIndex);

ds_list_add(dialogues, dial);
