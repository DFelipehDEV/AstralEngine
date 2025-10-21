/// NPCDispatch()
player = noone;
instance_destroy_id(dialogueQuerier);
var i;
for (i = 0; i < ds_list_size(dialogues); i += 1) {
    show_debug_message("Deleting dialogue: " + string(i));
    ds_map_destroy(ds_list_find_value(dialogues, i));
}
ds_list_destroy(dialogues);
show_debug_message("Finished deleting dialogue from " + string(id));
