/// BuzzerStateShoot()
if (stateEntering) {
    EnemySetAnimation(sprEnemyBuzzerAttack, 0.1);
    xSpeed = 0;
    exit;
}
if (stateExiting) {
    exit;
}

if (instance_exists(target) && stateTimer <= 30) {
    shootStep += global.timeScale;
    if (shootStep >= 15) {
        shootStep = 0;
        with (instance_create(x + 9 * image_xscale, y + 12, objProjectile)) {
            sprite_index = sprEnemyBuzzerProjectile;
            image_speed = 0.25 * global.timeScale;
            hspeed = (4 * dcos(point_direction(x, y, other.target.x, other.target.y))) * global.timeScale;
            vspeed = -4 * dsin(point_direction(x, y, other.target.x, other.target.y)) * global.timeScale;
        }

        PlaySound(sndShot, 0.75, 1.1, false, true);
    }
}

if (!instance_exists(target) || stateTimer > 60) {
    target = noone;
    StatesSet(BuzzerStateNormal);
}
