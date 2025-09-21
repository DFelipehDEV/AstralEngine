/// SaveGame()
SaveSetValue("version", SaveVersion);
SaveSetValue("timestamp", date_current_datetime());

var _string;
_string = ds_map_write_ini_string(global.saveData);

// Encrypt the file using rc4
var _buffer;
_buffer = buffer_create();
buffer_write_string(_buffer, _string);
buffer_rc4(_buffer, SavePassword);
buffer_save(_buffer, SaveFileName);
buffer_destroy(_buffer);

return buffer_get_size(_buffer) > 0;
