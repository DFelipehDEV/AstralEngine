/// SaveGetValue(key)
var _key;
_key = argument0;

if (ds_map_exists(global.saveData, _key)) {
    return ds_map_find_value(global.saveData, _key);
}

return -1;
