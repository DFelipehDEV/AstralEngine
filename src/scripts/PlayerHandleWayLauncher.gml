/// PlayerHandleWayLauncher()
// Handles collision with way launchers

if (state != PlayerStateHurt && !ground) {
    var _waylauncher;
    _waylauncher = PlayerCollisionHitbox(x, y, objWayLauncher)

    if (_waylauncher != noone) {
        if (!_waylauncher.active && _waylauncher.sprite_index == sprWayLauncher) {
            x = _waylauncher.x;
            y = _waylauncher.y;
            visible = false;

            PlayerSetState(PlayerStateWaylauncher);

            with (_waylauncher) {
                active = true;
                timerExit = 0;
                ownerID = other.id;
            }

            AnimationApply("");
            PlaySound("snd/WayLauncherChangeDir");
            PlaySoundExt("snd/WayLauncherWait", global.volumeSounds, 1, true);
        }
    }
}
