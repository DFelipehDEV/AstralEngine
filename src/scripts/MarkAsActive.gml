/// MarkAsActive()
if (instance_exists(objWorld)) {
    ds_list_add(objWorld.deactivateExceptions, id);
}
