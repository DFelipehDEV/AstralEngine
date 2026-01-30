/// PlayerHandleFootstepSensors()
var _sensor;
_sensor = PlayerCollisionObjectMain(x, y, objFootstepSensor);
if (_sensor != noone) {
    PlayerSetTerrainType(_sensor.type);
}
