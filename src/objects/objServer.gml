#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init

var address, name, port;

address = "127.0.0.1";
port = 39073;

socket = socket_create();
socket_connect(socket, address, port);

global.buffer = buffer_create();
connected = false;

player_id = 0;

// send name
buffer_clear(global.buffer);
buffer_write_u8(global.buffer, 1);
socket_write_message(socket, global.buffer);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stop server

buffer_at_end(socket);
buffer_destroy(buffer);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sync

var s, xx, yy, xxscale, anim;

// send position and speed
buffer_clear(global.buffer);
buffer_write_u8(global.buffer, 2);
with objPlayer {
    buffer_write_u16(global.buffer, x);
    buffer_write_u16(global.buffer, y);
    buffer_write_float(global.buffer, xDirection);
    buffer_write_string(global.buffer, animation);
}
socket_write_message(socket, global.buffer);

socket_update_read(socket);

while socket_read_message(socket, global.buffer) {
    var type;
    type = buffer_read_u8(global.buffer);

    switch(type) {
        case 1: // player id
            objPlayer.player_id = buffer_read_u32(global.buffer);
            break;

        case 2: // move remote players
            var _id;
            while !buffer_at_end(global.buffer) {
                _id = buffer_read_u32(global.buffer);
                xx = buffer_read_u16(global.buffer);
                yy = buffer_read_u16(global.buffer);
                xxscale = buffer_read_float(global.buffer);
                anim = buffer_read_string(global.buffer);
                with objRemotePlayer {
                    if server_id = _id {
                        x = xx;
                        y = yy;
                        image_xscale = xxscale;
                        AnimationApply(anim);
                    }
                }
            }
            break;

        case 3: // create remote player
            var _player;
            _player = instance_create(0, 0, objRemotePlayer);
            _player.server_id = buffer_read_u32(global.buffer);
            break;

        case 4: // destroy remote player
            var _id;
            _id = buffer_read_u32(global.buffer);
            with objRemotePlayer {
                if server_id = _id {
                    instance_destroy();
                }
            }
            break;

    }
}

s = socket_get_state(socket);
if s = 2 and !connected {
    connected = true;
}

if s = 4 {
    show_message("Connection closed.");
    game_end();
    exit;
}

if s = 5 or socket_get_write_data_length(socket) > max_write_data_length {
    socket_reset(socket);
    if connected {
        show_message("Connection lost.");
    } else {
        show_message("Could not connect to server.");
    }
    game_end();
    exit;
}

socket_update_write(socket);
