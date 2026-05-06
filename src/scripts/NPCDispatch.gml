/// NPCDispatch()
player = noone;
instance_destroy_id(dialogueQuerier);
Log("Deleting dialogues array");
dss_destroy(dialogues);
Log("Finished deleting dialogue from " + string(id));
