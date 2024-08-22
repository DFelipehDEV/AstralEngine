/// PlayerHandleProjectile()
// Handle collison with projectiles

var _projectile;
_projectile = PlayerCollisionHitbox(x, y, parProjectile);

// Check if is meeting the projectile
if (_projectile != noone) {
    if (shield == ShieldNormal) {
        // Reflect projectiles with shields
        with (_projectile) {
            hspeed = -sign(hspeed);
            vspeed = -4;
        }
    }
    else {
        // Hurt the player
        PlayerHurt();
    }
}
