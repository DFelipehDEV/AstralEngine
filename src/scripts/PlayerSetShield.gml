/// PlayerSetShield(shield)
var _newShield;
_newShield = argument0;
if (shield != _newShield) {
    if (instance_exists(shieldInstance)) {
        instance_destroy_id(shieldInstance);
        shieldInstance = noone;
    }

    shield = _newShield;
    if (shield != noone) {
        with (instance_create(x, y, shield)) {
            other.shieldInstance = id;
            body = other.id;
        }
    }
}
