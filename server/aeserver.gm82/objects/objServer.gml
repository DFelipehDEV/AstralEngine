#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init

listeningsocket = listeningsocket_create();
listeningsocket_start_listening(listeningsocket, false, 39073, false);

global.buffer = buffer_create();

players = ds_list_create();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sync

var _player;

while listeningsocket_can_accept(listeningsocket) {
    _player = instance_create(0, 0, objPlayer);
    _player.socket = socket_create();
    listeningsocket_accept(listeningsocket, _player.socket);
    _player.ip = socket_get_peer_address(_player.socket);
    _player.player_id = random_range(0, 65534);
    ds_list_add(players, _player);

    // send player id
    buffer_clear(global.buffer);
    buffer_write_u8(global.buffer, 1);
    buffer_write_u32(global.buffer, _player.player_id);
    socket_write_message(_player.socket, global.buffer);

}

if !listeningsocket_is_listening(listeningsocket) {
    show_message("Can't listen for incoming connections!");
    game_end();
    exit;
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
listeningsocket_destroy(listeningsocket);
buffer_destroy(global.buffer);
