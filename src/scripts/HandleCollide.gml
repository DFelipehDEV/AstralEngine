/// HandleCollide(player)
var _player;
_player = argument0;
if (_player.ySpeed >= 0) {
    pull = true;
    player = _player;
    player.x = x;
    player.xSpeed = 0;
    player.ySpeed = 0;
    player.canMove = false;

    if (player.state != PlayerStateGrab) {
        PlaySound(sndGrab);
    }

    with (player) {
        StatesSet(PlayerStateGrab);
        AnimationApply("HANG");
    }
}
