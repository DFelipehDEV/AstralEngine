/// WorldDeactivationUpdate()
// Clean up destroyed instances before deactivating
var i, _instance;
for (i = ds_list_size(deactivateExceptions) - 1; i >= 0; i -= 1) {
    _instance = ds_list_find_value(deactivateExceptions, i);
    if (!instance_exists(_instance)) {
        ds_list_delete(deactivateExceptions, i);
    }
}

instance_deactivate_all(true);
instance_activate_object(gm82core_object);
instance_activate_object(objAlwaysActive);

// Activate specific exception instances
for (i = 0; i < ds_list_size(deactivateExceptions); i += 1) {
    _instance = ds_list_find_value(deactivateExceptions, i);
    instance_activate_object(_instance);
}

instance_activate_region(view_xview[0] - 64, view_yview[0] - 32, view_wview[0] + 96, view_hview[0] + 96, 1);
