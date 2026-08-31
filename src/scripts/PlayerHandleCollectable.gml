/// PlayerHandleCollectable()
if (!instance_exists(objCollectable)) exit;

var _collectable;
_collectable = PlayerCollisionHitbox(x, y, objCollectable);
if (_collectable != noone) {
    with (_collectable) {
        if (collectable) {
            collector = other;
            event_user(0);
        }
    }
}
