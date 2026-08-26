#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();

sensor = noone;
cam = noone;
previousTarget = noone;
previousLockedX = -1;
previousLockedY = -1;
path = noone;
path_speed = 4;
baseSpeed = 4;
pathAction = path_action_stop;
pathAbsolute = true;
started = false;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Safety cleanup
if (instance_exists(cam)) {
    if (cam.target == id) {
        if (instance_exists(previousTarget)) {
            cam.target = previousTarget;
        } else {
            cam.target = instance_nearest(x, y, objPlayer);
        }
    }
    if (previousLockedX != -1 && cam.lockedX == -1) {
        cam.lockedX = previousLockedX;
    }
    if (previousLockedY != -1 && cam.lockedY == -1) {
        cam.lockedY = previousLockedY;
    }
}

if (instance_exists(sensor)) {
    sensor.follower = noone;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update speed with timescale
if (started && path_index != -1) {
    path_speed = baseSpeed * global.timeScale;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Path End Check
if (started && pathAction == path_action_stop) {
    if (path_index == -1 || path_position >= 1) {
        event_user(1);
    }
}
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// End of Path Event
event_user(1);
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Start path
if (path != noone) {
    baseSpeed = path_speed;
    if (pathAbsolute) {
        x = path_get_point_x(path, 0);
        y = path_get_point_y(path, 0);
    }
    path_start(path, baseSpeed * global.timeScale, pathAction, pathAbsolute);
    started = true;
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Finish and restore camera
if (!started) exit;
started = false;

if (instance_exists(cam)) {
    if (cam.target == id) {
        if (instance_exists(previousTarget)) {
            cam.target = previousTarget;
        } else {
            cam.target = instance_nearest(x, y, objPlayer);
        }
    }
    if (previousLockedX != -1 && cam.lockedX == -1) {
        cam.lockedX = previousLockedX;
    }
    if (previousLockedY != -1 && cam.lockedY == -1) {
        cam.lockedY = previousLockedY;
    }
}

if (instance_exists(sensor)) {
    sensor.active = false;
    if (sensor.triggerOnce) {
        with (sensor) {
            instance_destroy();
        }
    }
}

instance_destroy();