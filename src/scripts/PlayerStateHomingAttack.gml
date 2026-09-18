/// PlayerStateHomingAttack()
if (stateEntering) {
    PlayerResetAirdash();
    AnimationPlay("JUMP");
    exit;
}
if (stateExiting) {
    exit;
}

canHome = true;
afterImageTimer = 15;
if (!instance_exists(homingReticle)){
    PlayerResetHomingAttack();
    exit;
}

animationSpeed = 0.55 + abs(xSpeed)/17;

var _homingTargetDirection;
_homingTargetDirection = point_direction(x, y, homingReticle.x, homingReticle.y);

// Check if we are not inside terrain
if (!PlayerCollisionMain(x, y) && stateTimer < 50) {
    xSpeed = lengthdir_x(homingSpeed, _homingTargetDirection);
    ySpeed = lengthdir_y(homingSpeed, _homingTargetDirection);
} else {
    // Stop homing attack
    StatesSet(PlayerStateAir);
    AnimationPlay("LANDING");
}
