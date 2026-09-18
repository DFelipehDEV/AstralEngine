/// DeactivateExceptionsRemove(instance)
var _instance, i;
_instance = argument0;
for (i = ds_list_size(World.deactivateExceptions) - 1; i >= 0; i -= 1) {
    if (ds_list_find_value(World.deactivateExceptions, i) == _instance) {
        ds_list_delete(World.deactivateExceptions, i);
    }
}
