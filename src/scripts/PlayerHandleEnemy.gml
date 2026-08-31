/// PlayerHandleEnemy()
if (!instance_exists(objEnemy)) exit;

var _enemy;
_enemy = PlayerCollisionHitbox(x, y, objEnemy);
if (_enemy != noone) {
    if (canAttack) {
        if (_enemy.invincibilityTimer == 0) {
            // Bounce on the enemy
            if (state == PlayerStateJump && ySpeed > 0) {
                ySpeed = -ySpeed * 1.1;
            }

            if (!boosting) {
                _enemy.hp -= 1;
            } else {
                _enemy.hp -= 2;
            }

            _enemy.hit = true;
            _enemy.invincibilityTimer = 17;

            if (_enemy.hp <= 0) {
                if (_enemy.knockOnDeath) {
                    var _enemyDeath;
                    _enemyDeath = instance_create(_enemy.x, _enemy.y, objEnemyDeath);
                    _enemyDeath.hspeed = (xSpeed * 1.05) * global.timeScale;

                    if (ground) {
                        _enemyDeath.vspeed = -6 * global.timeScale;
                    } else {
                        _enemyDeath.vspeed = (ySpeed * 0.7) * global.timeScale;
                    }

                    _enemyDeath.gravity = 0.2 * sqr(global.timeScale);
                    _enemyDeath.alarm[0] = round(40 / global.timeScale);
                    _enemyDeath.sprite_index = _enemy.sprite_index;
                } else {
                    with(_enemy) {
                        CreateDummy(x, y, sprExplosion, 0.35, 0, -0.1, bm_normal, 1, 1, 1, 0);
                        PlaySoundSingle(choose(sndExplosion, sndExplosion2));

                        repeat(6) {
                            var _metal;
                            _metal = instance_create(x, y, objEnemyMetal);
                            _metal.hspeed = random_range(-3, 3);
                            _metal.vspeed = random_range(-5, -3);
                        }
                    }
                }

                instance_destroy_id(_enemy);
            }

            with (PlayerGetOwnedCamera()) CameraShakeY(17);
            CreateDummy(x, y, sprHit, 0.45, 0, -0.1, bm_add, 1, 1, 1, 0);
            PlaySound(choose(sndEnemyHit, sndEnemyHit2, sndEnemyHit3));
            PlayerAddEnergy(8);
            PlayerResetHomingAttack();
        }
    } else {
        PlayerHurt();
    }
}
