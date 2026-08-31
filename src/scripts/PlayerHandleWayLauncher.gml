/// PlayerHandleWayLauncher()
if (!instance_exists(objWayLauncher)) exit;

if (state != PlayerStateHurt && !ground) {
    var _waylauncher;
    _waylauncher = PlayerCollisionHitbox(x, y, objWayLauncher);

    if (_waylauncher != noone) {
        if (_waylauncher.player == noone && _waylauncher.timerExit == 0) {
            x = _waylauncher.x;
            y = _waylauncher.y;
            visible = false;

            StatesSet(PlayerStateWaylauncher);

            _waylauncher.player = id;

            AnimationPlay("");
            PlaySound(sndWayLauncherChangeDir);
            _waylauncher.waitSound = PlaySound(sndWayLauncherWait, 1, 1, true);
        }
    }
}
