/// RingCollide(player)
var _player;
_player = argument0;
if (_player.state == PlayerStateHurt) exit;

global.playerRings += value;
with (_player) PlayerAddEnergy(4);
instance_destroy();
