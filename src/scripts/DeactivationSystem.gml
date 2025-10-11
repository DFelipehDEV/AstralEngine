/// DeactivationSystem(event)
switch (argument0) {
    case ev_create:
        global.deactivateExceptions = ds_list_create();
        break;

    case ev_step:
        if (GameStateGet() == GameStatePaused) exit;
        instance_deactivate_all(true);
        instance_activate_object(objPlatformMove);
        instance_activate_object(objVFX);
        instance_activate_object(objSingleton);
        instance_activate_object(gm82core_object);
        instance_activate_object(objTerrain);

        instance_deactivate_object(objSpikeMove)

        // Activate specific instances
        var _instance;
        for (_instance = 0; _instance < ds_list_size(global.deactivateExceptions); _instance += 1) {
            instance_activate_object(ds_list_find_value(global.deactivateExceptions, _instance));
        }

        instance_activate_region(view_xview[0] - 64, view_yview[0] - 32, ScreenWidth + 96, ScreenHeight + 96, 1);
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
