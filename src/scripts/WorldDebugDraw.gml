/// WorldDebugDraw()
if (!debugOverlay) exit;
BeginUI();
draw_rect(333, 72, 179, 240, c_black, 0.5, 0);
draw_set_font(fontConsolas8);
draw_set_halign(fa_left);
draw_set_color(c_white);

var _player;
_player = instance_find(objPlayer, 0);
if (_player != noone) {
    // Debug overlay
    var _playerText;
    _playerText = "FPS:" + string(fps) + " " + string(fps_real)
    + "#TAB:TOGGLE OVERLAY#RMB:LERP PLAYER POSITION#R:RESTART ROOM#PGUP:NEXT ROOM#PGDN:PREVIOUS ROOM"
    + "#id:" + string(_player.id)
    + "#x:" + string(floor(_player.x)) + " " + string(_player.xSpeed)
    + "#y:" + string(floor(_player.y)) + " " + string(_player.ySpeed)
    + "#ground:" + string(_player.ground)
    + "#angle:" + string(_player.angle) + " " + string(_player.angleCos) + " " + string(_player.angleSin) + " " + string(_player.angleMode)
    + "#xDirection:" + string(_player.xDirection)
    + "#state:" + script_get_name(_player.state)
    + "#previousState:" + script_get_name(_player.previousState)
    + "#stateTimer:" + string(_player.stateTimer)
    + "#animation:" + _player.animation
    draw_text(333, 72, _playerText);
}
EndUI();
