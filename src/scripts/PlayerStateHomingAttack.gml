/// PlayerStateHomingAttack()

afterimageTimer = 15;
if (!instance_exists(homingReticle.target)){ PlayerSetState(PlayerStateNormal); exit; }

animationFrameSpeed = 0.55 + abs(xSpeed)/17;

var _homingTargetDirection;
_homingTargetDirection = point_direction(x, y, homingReticle.target.x, homingReticle.target.y);

// Check if we are not inside terrain
if (!place_meeting(x, y, objSolid) && !place_meeting(x, y, objPlatform) && stateTimer < 50) {
    xSpeed = lengthdir_x(homingSpeed, _homingTargetDirection);
    ySpeed = lengthdir_y(homingSpeed, _homingTargetDirection);
}
else {
    // Stop homing attack
    xSpeed = 0;
    ySpeed = 0;
    PlayerSetState(PlayerStateNormal);
}
