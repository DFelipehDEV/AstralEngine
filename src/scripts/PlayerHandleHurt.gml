/// PlayerHandleHurt()

var _hurt;
_hurt = PlayerCollisionHitbox(x, y, objHurt);

if (_hurt != noone) {
    if (_hurt.canHurt) {
        PlayerHurt();
    }
}
