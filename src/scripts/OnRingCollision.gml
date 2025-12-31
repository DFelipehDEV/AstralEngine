/// OnRingCollision(player)
var _player;
_player = argument0;

global.playerRings += 1;
with (_player) PlayerAddEnergy(4);
instance_create(x, y, objRingCollected);
PlaySoundSingle(sndRing);
instance_destroy();
