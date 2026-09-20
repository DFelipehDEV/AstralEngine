/// TrailUpdate(x, y, alpha)
ds_list_add(trailList, argument0);
ds_list_add(trailList, argument1);
ds_list_add(trailList, argument2);

if (ds_list_size(trailList) > trailLength * 3) {
    repeat (3) {
        ds_list_delete(trailList, 0);
    }
}
