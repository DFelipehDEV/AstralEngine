/// PlayerHandleMonitor()
var _monitor;
_monitor = PlayerCollisionObjectMain(x, y, objMonitor);

if (_monitor != noone) {
    with (_monitor) {
        monIcon = instance_create(x, y, objMonitorIcon);
        monIcon.player = other.id;
        monIcon.icon = icon;

        CreateDummy(x, y, sprExplosion, 0.35, 0, -0.1, bm_normal, 1, 1, 1, 0);
        PlaySoundSingle(sndExplosion);
        PlaySoundSingle(sndMonitor);
        instance_destroy();
    }

    if (state == PlayerStateJump && ySpeed > 0) {
        ySpeed *= -0.9;
    }

    PlayerResetHomingAttack();
}
