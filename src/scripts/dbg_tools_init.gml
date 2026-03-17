/// dbg_tools_init()
//DBGTools Version 0.1
global.debugSelectedInstance = noone; // The single instance we right-clicked
global.debugInstancesBeingWatched = ds_list_create(); // All instances with open windows
global.debugViewInstance = noone;
global.debugPreviousViewInstance = view_object;

global.debugSpritesCSV = "";
global.debugSpriteList = ds_list_create();
global.debugSpriteMap = ds_map_create();
var _spriteCount;
_spriteCount = sprite_create_from_screen(0, 0, 1, 1, false, false, 0, 0);
sprite_delete(_spriteCount);
var i, _comboIdx;
_comboIdx = 0;
for (i = 0; i < _spriteCount; i += 1) {
    if (sprite_exists(i)) {
        global.debugSpritesCSV += sprite_get_name(i) + ",";
        ds_list_add(global.debugSpriteList, i);
        ds_map_add(global.debugSpriteMap, i, _comboIdx);
        _comboIdx += 1;
    }
}
if (string_length(global.debugSpritesCSV) > 0) {
    global.debugSpritesCSV = string_copy(global.debugSpritesCSV, 1, string_length(global.debugSpritesCSV) - 1);
}

global.debugRoomsCSV = "";
global.debugRoomList = ds_list_create(); // Combobox Index -> GM Room Index
global.debugRoomMap = ds_map_create(); // GM Room Index -> Combobox Index
var _r, _roomComboIdx;
_r = room_first;
_roomComboIdx = 0;
while (_r != -1) {
    global.debugRoomsCSV += room_get_name(_r) + ",";
    ds_list_add(global.debugRoomList, _r);
    ds_map_add(global.debugRoomMap, _r, _roomComboIdx);
    _roomComboIdx += 1;
    if (_r == room_last) break;
    _r = room_next(_r);
}
if (string_length(global.debugRoomsCSV) > 0) {
    global.debugRoomsCSV = string_copy(global.debugRoomsCSV, 1, string_length(global.debugRoomsCSV) - 1);
}
