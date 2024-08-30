/// PlayerHandleCrane()
// Handle Crane collision

var _handle;
_handle = PlayerCollisionObjectMain(x, y, objHandle);

//Check if is meeting the fling sensor
if (_handle != noone && ySpeed >= 0) {
    if (action != PlayerActionGrab) {
        PlaySound("snd/PlayerGrab");
    }
    _handle.ownerID = id;
    x = _handle.x;
    _handle.pull = true;
    xSpeed = 0;
    ySpeed = 0;

    PlayerSetAction(PlayerActionGrab);
    AnimationApply("HANG_1")
    canMove = false;
}
