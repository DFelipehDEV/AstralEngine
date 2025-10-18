/// DeactivateExceptionsRemove(instance)
var _instance, i;
_instance = argument0;
for (i = 0; i < ds_list_size(global.deactivateExceptions); i += 1) {
    if (ds_list_find_value(global.deactivateExceptions, i) == _instance) {
        ds_list_delete(global.deactivateExceptions, i);
    }
}
