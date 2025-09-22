/// PlayerHandleCrane()
// Handle Crane collision

var _handle;
_handle = PlayerCollisionObjectMain(x, y, objHandle);

//Check if is meeting the fling sensor
if (_handle != noone && ySpeed >= 0) {
    if (state != PlayerStateGrab) {
        PlaySound(sndGrab);
    }
    _handle.player = id;
    x = _handle.x;
    _handle.pull = true;
    xSpeed = 0;
    ySpeed = 0;

    StatesSet(PlayerStateGrab);
    AnimationApply("HANG")
    canMove = false;
}
