/// PlayerStateSlide()
if (stateEntering) {
    slideCancelTimer = 35;
    AnimationPlay("SLIDE");
    exit;
}

if (stateExiting) {
    audio_stop(sndPlayerSlide);
    exit;
}
animationSpeed = 0.2 + abs(xSpeed)/18;

PlayerApplySlopeFactor(global.timeScale);

var _inSlidepass;
_inSlidepass = false;
if (instance_exists(objSlidepassSensor)) {
    if (distance_to_object(objSlidepassSensor) <= 15) {
        _inSlidepass = true;
    }
}

if (!_inSlidepass) {
    // Decelerate while going to the left
    if (xSpeed < 0) {
        xSpeed += slideFriction;
    }

    // Decelerate while going to the right
    if (xSpeed > 0) {
        xSpeed -= slideFriction;
    }

    // Decrease reset timer if is not holding the slide key
    if (!keySlide && slideCancelTimer > 0) {
        slideCancelTimer = max(slideCancelTimer - global.timeScale, 0);
    }

    // Back to the normal state if the player stopped or is not in the ground anymore
    if (!ground || floor(xSpeed) == 0 || !keySlide && slideCancelTimer == 0) {
        StatesSet(PlayerStateNormal);
    }
}
else {
    lockKeysTimer = 15;
}

// Create dust effect
if (alarm[0] == -1) {
    alarm[0] = 3;
}


// Physics
if (sign(xSpeed) == sign(angleSin)) {
    xSpeed -= rollUphillFriction * angleSin;
}

if (sign(xSpeed) != sign(angleSin)) {
    xSpeed -= rollDownhillForce * angleSin;
}

if (ground) {
    PlayerJump();
}

PlayerRotateSpriteToAngle();

xDirection = esign(xSpeed, xDirection);
