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
        with (target.cam) CameraShakeY(40);
    }

    if (collision_rectangle(x, y, x + 50, y + 32, objPlayer, false, 1)) {
        with (target) PlayerHurt();
    }
}

if (image_index >= 8) {
    hammer = false;
    if (distance_to_object(objPlayer) > 150 || objPlayer.state == PlayerStateDead) {
        EnemySetAnimation(sprEnemyHeavyWalk, 0.15);
        StatesSet(HeavyStateReturn);
    } else {
        EnemySetAnimation(sprEnemyHeavyWalk, 0.15);
        StatesSet(HeavyStateChase);
    }
}
