/// PlayerHandleEnemy()
// Handle enemies collision

var _enemy;
_enemy = PlayerCollisionHitbox(x, y, parEnemy);

// Check if the player is meeting the enemy and it has no invincibility
if (_enemy != noone) {
    // Check if the player is doing any of these actions
    if (attackPossible) {
        // Check if the enemy does not have invincibility frames
        if (_enemy.enemyBlinkTimer == 0) {
            // Decrease enemy HP
            if (_enemy.enemyHP > 0) {
                // Decrease enemy HP and give him small invincibility
                with (_enemy) {
                    hit = true;
                    enemyBlinkTimer = 20;
                    enemyHP -= 1;
                }

                // Deal more damage while boosting
                if (boosting) {
                    with (_enemy) {
                        enemyHP -= 1;
                    }
                }
            }

            var _enemyX, _enemyY;
            _enemyX = _enemy.x;
            _enemyY = _enemy.y;
            // Check if the enemy has no HP
            if (_enemy.enemyHP == noone || _enemy.enemyHP <= 0) {
                // Check if the enemy "bust", in that case it is false so it will just explode
                if (!_enemy.enemyBust) {
                    with(_enemy) {
                        DummyEffectCreate(x, y, sprVFXExplosion1, 0.35, 0, -0.1, bm_normal, 1, 1, 1, 0);
                        PlaySoundExt(choose("sndExplosion1", "sndExplosion2"), global.volumeAmbient, 1, false);

                        repeat(6) {
                            var _metal;
                            _metal = instance_create(x, y, objEnemyMetal);
                            _metal.hspeed = random_range(-3, 3);
                            _metal.vspeed = random_range(-5, -3);
                        }
                    }
                }
                else {
                    // Otherwise, bust him
                    var _enemyDeath;
                    _enemyDeath = instance_create(_enemyX, _enemyY, objEnemyDeath);
                    _enemyDeath.hspeed = xSpeed * 1.05;

                    if (ground) {
                        _enemyDeath.vspeed = -6;
                    }
                    else {
                        _enemyDeath.vspeed = ySpeed * 0.7;
                    }

                    _enemyDeath.gravity = 0.2;
                    _enemyDeath.alarm[0] = 40;
                    _enemyDeath.sprite_index = _enemy.sprite_index;
                }

                with (_enemy) {
                    instance_destroy();
                }

                // Check if we are in a fight event
                if (distance_to_object(objFightEnemiesSensor) < 50) {
                    with instance_nearest(x, y, objFightEnemiesSensor) {
                        phaseEnemiesRemaining -= 1;
                        if (phaseEnemiesRemaining == 0) {
                            delay = 70;
                            phaseEnemiesCreated = false;
                        }
                    }
                    objControllerStage.hudEnemyScale = 3;
                }
            }

            // Stop homing if the player was homing
            PlayerHomingReset(PlayerActionHomingFlight, 0, -6.7, 35, _enemyX, _enemyY);

            // Bounce on the enemy
            if (action == PlayerActionJump && ySpeed >= 0) {
                // Check if the player is holding the jump key
                if (keyAction) {
                    ySpeed = -ySpeed * 1.15;
                }
                // Otherwise, give less height
                else {
                    ySpeed = -ySpeed * 0.99;
                }
            }

            with (cam)
                CameraShakeY(17);

            DummyEffectCreate(x, y, sprVFXHit, 0.45, 0, -0.1, bm_add, 1, 1, 1, 0);
            PlaySound(choose("sndPlayerEnemyHit1", "sndPlayerEnemyHit2", "sndPlayerEnemyHit3"));
            PlayerAddEnergy(8);
        }
    }
    else {
        PlayerHurt();
    }
}
