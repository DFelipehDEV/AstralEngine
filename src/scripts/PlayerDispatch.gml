/// PlayerDispatch()
ds_list_destroy(trailList);
ds_list_destroy(homingObjects);

instance_destroy_id(shieldInstance);
instance_destroy_id(cam);
instance_destroy_id(boostAura);

StopSound(grindSound);
