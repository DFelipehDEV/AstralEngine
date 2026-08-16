/// PlayerHandleProjectile()
if (!instance_exists(objProjectile)) exit;

var _projectile;
_projectile = PlayerCollisionHitbox(x, y, objProjectile);

if (_projectile != noone) {
    if (shield == objShieldNormal) {
        // Reflect projectiles with shields
        with (_projectile) {
            hspeed = -sign(hspeed);
            vspeed = -4;
        }
    } else {
        PlayerHurt();
    }
}
