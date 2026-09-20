/// PlayerHandleEnemy()
if (!instance_exists(objEnemy)) exit;

var _enemy;
_enemy = PlayerCollisionHitbox(x, y, objEnemy);
if (_enemy != noone) {
    if (canAttack) {
        if (_enemy.invincibilityTimer == 0) {
            if (state == PlayerStateJump && ySpeed > 0) {
                ySpeed = -ySpeed * 1.1;
            }
            with (_enemy) {
                attacker = other;
                event_user(1);
            }
        }
    } else {
        PlayerHurt();
    }
}
