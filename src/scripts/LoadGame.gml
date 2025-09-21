/// LoadGame()
if (!file_exists(SaveFileName)) {
    return false;
}

var _buffer;
_buffer = buffer_create(SaveFileName);
buffer_rc4(_buffer, SavePassword);

var _string;
_string = buffer_read_string(_buffer);
show_debug_message(_string);

return ds_map_read_ini_string(global.saveData, _string);
