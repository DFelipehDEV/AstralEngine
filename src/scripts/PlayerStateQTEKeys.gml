/// PlayerStateQTEKeys(failedXSpeed, failedYSpeed)
if (stateEntering) {
    with (instance_create(x, y, objQTEKeys)) {
        player = other.id;
        failedXSpeed = argument0;
        failedYSpeed = argument1;
    }
    exit;
}
if (stateExiting) {
    global.timeScale = 1;
    exit;
}

global.timeScale = approach(global.timeScale, 0.04, 0.02)

xDirection = esign(xSpeed, xDirection);
