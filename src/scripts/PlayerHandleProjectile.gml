/// PlayerHandleProjectile()
if (!instance_exists(objProjectile)) exit;

var _projectile;
_projectile = PlayerCollisionHitbox(x, y, objProjectile);
if (_projectile != noone) {
    if (instance_exists(shieldInstance)) {
        if (shieldInstance.reflects) {
            // Reflect projectiles with shields
            with (_projectile) {
                hspeed = -hspeed;
                vspeed = -vspeed;
            }
            exit;
        }
    }

    PlayerHurt();
}
