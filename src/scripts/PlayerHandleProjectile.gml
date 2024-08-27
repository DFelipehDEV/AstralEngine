/// PlayerHandleProjectile()

var _projectile;
_projectile = PlayerCollisionHitbox(x, y, parProjectile);

if (_projectile != noone) {
    if (shield == ShieldNormal) {
        // Reflect projectiles with shields
        with (_projectile) {
            hspeed = -sign(hspeed);
            vspeed = -4;
        }
    }
    else {
        PlayerHurt();
    }
}
