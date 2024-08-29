/// PlayerSetShield(shield)
var _newShield;
_newShield = argument0;
if (shield != _newShield) {
    if (shieldInstance != noone) {
        instance_destroy_id(shieldInstance);
        shieldInstance = noone;
    }
    switch (_newShield) {
        case ShieldNormal:
            shield = ShieldNormal;
            with (instance_create(x, y, objShieldNormal)) {
                other.shieldInstance = id;
                ownerID = other.id; // Assign player ID to the shield
            }
            break;

        case ShieldElectricity:
            shield = ShieldElectricity;
            with (instance_create(x, y, objShieldElectricity)) {
                other.shieldInstance = id;
                ownerID = other.id; // Assign player ID to the shield
            }
            break;
    }
}
