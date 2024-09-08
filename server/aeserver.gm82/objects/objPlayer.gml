#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init

animation = ""
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
socket_destroy(socket);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sync

// send position and speed of other players
buffer_clear(global.buffer);
buffer_write_u8(global.buffer, 2);
// don't send the data if the write buffer is already very large
if (socket_get_write_data_length(socket) < limit_write_data_length) {
    with (objPlayer) {
        if id != other.id {
            buffer_write_u32(global.buffer, player_id);
            buffer_write_u16(global.buffer, x);
            buffer_write_u16(global.buffer, y);
            buffer_write_float(global.buffer, image_xscale);
            buffer_write_string(global.buffer, animation);
        }
    }
}
socket_write_message(socket, global.buffer);
socket_update_read(socket);

var _messageType;
while (socket_read_message(socket, global.buffer)) {
    _messageType = buffer_read_u8(global.buffer);
    switch(_messageType) {
        case 1:
            // send other player ids
            with (objPlayer) {
                if (id != other.id) {
                    buffer_clear(global.buffer);
                    buffer_write_u8(global.buffer, 3);
                    buffer_write_u32(global.buffer, player_id);
                    socket_write_message(other.socket, global.buffer);
                }
            }
            // tell the other players that this player has joined
            with (objPlayer) {
                if (id != other.id) {
                    buffer_clear(global.buffer);
                    buffer_write_u8(global.buffer, 3);
                    buffer_write_u32(global.buffer, other.player_id);
                    socket_write_message(socket, global.buffer);
                }
            }
            break;
        
        case 2:
            x = buffer_read_u16(global.buffer);
            y = buffer_read_u16(global.buffer);
            image_xscale = buffer_read_float(global.buffer);
            animation = buffer_read_string(global.buffer);
            break;
        
    }
}

var _socketState;
_socketState = socket_get_state(socket);
if (_socketState = 4 || _socketState = 5 || socket_get_write_data_length(socket) > max_write_data_length) {
    // tell the other players that this player has left
    with (objPlayer) {
        if (id != other.id) {
            buffer_clear(global.buffer);
            buffer_write_u8(global.buffer, 4);
            buffer_write_u32(global.buffer, other.player_id);
            socket_write_message(socket, global.buffer);
        }
    }
    instance_destroy();
    exit;
}

socket_update_write(socket);
