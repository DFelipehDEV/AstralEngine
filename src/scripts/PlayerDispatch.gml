/// PlayerDispatch()
ds_list_destroy(trailx);
ds_list_destroy(traily);
ds_list_destroy(trailal);

instance_destroy_id(shieldInstance);
instance_destroy_id(cam);
instance_destroy_id(boostAura);

audio_stop(grindSound);
