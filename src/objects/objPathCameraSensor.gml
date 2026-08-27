#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
path = noone;
path_speed = 4;
pathAction = path_action_stop;
pathAbsolute = true;
triggerOnce = true;

active = false;
follower = noone;
#define Collision_objCamera
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Follow Path Trigger
if (path == noone) exit;
if (active) exit;
if (instance_exists(follower)) exit;

active = true;

// Create follower instance
follower = instance_create(x, y, objCameraPathFollower);
follower.sensor = id;
follower.cam = other.id;
follower.previousTarget = other.target;
follower.previousLockedX = other.lockedX;
follower.previousLockedY = other.lockedY;
follower.path = path;
follower.path_speed = path_speed;
follower.pathAction = pathAction;
follower.pathAbsolute = pathAbsolute;

with (follower) {
    event_user(0);
}

// Make camera follow the follower object
other.lockedX = -1;
other.lockedY = -1;
other.target = follower;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
/*preview
*/
//field path: path
//field path_speed: number
//field pathAction: enum(path_action_stop,path_action_restart,path_action_continue,path_action_reverse)
//field pathAbsolute: bool
//field triggerOnce: bool
