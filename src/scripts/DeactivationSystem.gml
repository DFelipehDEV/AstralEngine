/// DeactivationSystem(event)
switch (argument0) {
    case ev_create:
        global.deactivateExceptions = ds_list_create();
        break;

    case ev_step:
        if (GameStateGet() == GameStatePaused) exit;
        instance_deactivate_all(true);
        instance_activate_object(gm82core_object);
        instance_activate_object(objAlwaysActive);

        // Activate specific instances
        var i, _instance;
        for (i = 0; i < ds_list_size(global.deactivateExceptions); i += 1) {
            _instance = ds_list_find_value(global.deactivateExceptions, i);
            instance_activate_object(_instance);

            if (!instance_exists(_instance)) DeactivateExceptionsRemove(_instance);
        }

        instance_activate_region(view_xview[0] - 64, view_yview[0] - 32, view_wview[0] + 96, view_hview[0] + 96, 1);
        break;

    case ev_room_end:
        ds_list_clear(global.deactivateExceptions);
        break;

    case ev_draw:
        BeginUI();
        if (debug_mode) draw_text(32, 32, string(ds_list_size(global.deactivateExceptions)));
        EndUI();
        break;
}
