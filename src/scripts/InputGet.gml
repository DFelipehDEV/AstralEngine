/// InputGet(Input, DeviceIndex)

var _input, _index;
_input = argument0;
_index = argument1;

return (input.inputDevice[_index] & (1 << _input)) != 0
