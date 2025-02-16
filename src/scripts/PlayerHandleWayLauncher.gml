/// PlayerHandleWayLauncher()
// Handles collision with way launchers

if (state != PlayerStateHurt && !ground) {
    var _waylauncher;
    _waylauncher = PlayerCollisionHitbox(x, y, objWayLauncher)

    if (_waylauncher != noone) {
        if (_waylauncher.player == noone && _waylauncher.timerExit == 0) {
            x = _waylauncher.x;
            y = _waylauncher.y;
            visible = false;

            PlayerSetState(PlayerStateWaylauncher);

            _waylauncher.player = id;

            AnimationApply("");
            PlaySound(sndWayLauncherChangeDir);
            PlaySoundExt(sndWayLauncherWait, global.soundVolume, 1, true);
        }
    }
}
