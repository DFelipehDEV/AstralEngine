/// BuzzerStateShoot()
if (stateEntering) {
    EnemySetAnimation(sprEnemyBuzzerAttack, 0.1);
    xSpeed = 0;
    exit;
}
if (stateExiting) {
    exit;
}

if (target != noone) {
    if (stateTimer == 15 || stateTimer == 30) {
        with (instance_create(x + 9 * image_xscale, y + 12, objProjectileBuzzer)) {
            hspeed = 4 * dcos(point_direction(x, y, other.target.x, other.target.y));
            vspeed = -4 * dsin(point_direction(x, y, other.target.x, other.target.y));
        }

        PlaySound(sndShot, 0.75, 1.1, false, true);
    }
}

if (distance_to_object(target) > 200 || stateTimer > 30) {
    target = noone;
    StatesSet(BuzzerStateNormal);
}
