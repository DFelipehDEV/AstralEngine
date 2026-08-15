/// DeactivateExceptionsRemove(instance)
var _instance, i;
_instance = argument0;
for (i = 0; i < ds_list_size(sysDeactivation.deactivateExceptions); i += 1) {
    if (ds_list_find_value(sysDeactivation.deactivateExceptions, i) == _instance) {
        ds_list_delete(sysDeactivation.deactivateExceptions, i);
    }
}
