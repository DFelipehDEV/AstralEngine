/// SaveSetRoomAsCompleted(room, time, rings)
var _roomName, _time, _rings;
_roomName = room_get_name(argument0);
_time = argument1;
_rings = argument2;

SaveSetValue(_roomName + "Completed", true);
SaveSetValue(_roomName + "Time", _time);
SaveSetValue(_roomName + "Rings", _rings);
