/// DeactivateExceptionsRemove(instance)
var _instance, i;
_instance = argument0;
for (i = 0; i < ds_list_size(objWorld.deactivateExceptions); i += 1) {
    if (ds_list_find_value(objWorld.deactivateExceptions, i) == _instance) {
        ds_list_delete(objWorld.deactivateExceptions, i);
    }
}
