/// HeavyStateAttack()
if (stateEntering) {
    exit;
}
if (stateExiting) {
    exit;
}

if (image_index > 3 && image_index < 5) {
    if (!hammer) {
        hammer = true;
        PlaySound(sndEnemyHeavyAttack);
        if (instance_exists(target)) {
            if (instance_exists(target.cam)) with (target.cam) CameraShakeY(40);
        }
    }

    if (collision_rectangle(x, y, x + 50 * image_xscale, y + 32, objPlayer, false, 1)) {
        if (instance_exists(target)) with (target) PlayerHurt();
    }
}

if (image_index >= 8) {
    hammer = false;
    var _player;
    _player = target;
    if (!instance_exists(_player)) {
        _player = instance_nearest(x, y, objPlayer);
    }

    if (!instance_exists(_player) || distance_to_object(_player) > 150 || _player.state == PlayerStateDead) {
        EnemySetAnimation(sprEnemyHeavyWalk, 0.15);
        StatesSet(HeavyStateReturn);
    } else {
        target = _player;
        EnemySetAnimation(sprEnemyHeavyWalk, 0.15);
        StatesSet(HeavyStateChase);
    }
}
