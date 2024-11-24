/// PlayerHandleDash()

// Dash pads
var _dashPad, _dashRing, _dashRamp, _dashRail;
_dashPad = PlayerCollisionHitbox(x, y, objDashPad);
if (_dashPad != noone) {
    if (pushingTerrain && !ground) {
        ground = true;
        PlayerSetAngle(_dashPad.image_angle);
        ySpeed = 0;
    }
    if (_dashPad.strength != 0) {
        xSpeed = _dashPad.strength * _dashPad.image_xscale;
    }
    interactDelay = 15;

    // Create dust
    DummyEffectCreate(x, y, sprDashDust, 0.25, 0, -0.1, bm_normal, 1, _dashPad.image_xscale, _dashPad.image_yscale, _dashPad.image_angle);
    // Play sound
    PlaySound("snd/DashPad");
}

// Dash ring
_dashRing = PlayerCollisionHitbox(x, y, objDashRing);
if (_dashRing != noone) {
    PlayerSetAngle(0);
    ground = false;
    x = _dashRing.x;
    y = _dashRing.y;
    xSpeed = _dashRing.strength * dcos(_dashRing.image_angle+90);
    ySpeed = -_dashRing.strength * dsin(_dashRing.image_angle+90);

    allowKeysTimer = 20;
    if (abs(xSpeed) >= 1) {
        xDirection = sign(xSpeed);
    }

    noGravityTimer = 18;
    image_angle = -_dashRing.image_angle;

    // Set slow motion
    if (_dashRing.playerAction == PlayerStateTricks) {
        global.timeScale = 0.4;
        trickCombo = 0;
    }

    PlayerSetState(_dashRing.playerAction);

    with (_dashRing) {
        image_xscale = 0.5;
        image_yscale = 0.5;
    }
    // Prevent spam
    interactDelay = 8;

    // Play sound
    PlaySound(_dashRing.interactSound);
}

// Dash ramps
_dashRamp = PlayerCollisionHitbox(x, y, objDashRamp);
if (_dashRamp != noone && ground) {
    if ((x >= _dashRamp.x - 45 && _dashRamp.image_xscale == 1) || (x <= _dashRamp.x + 45 && _dashRamp.image_xscale == -1)) {
        if (_dashRamp.xStrength != 0) {
            xSpeed = _dashRamp.xStrength * _dashRamp.image_xscale;
        }

        if (_dashRamp.yStrength != 0) {
            ySpeed = _dashRamp.yStrength;
            ground = false;
        }

        PlayerSetState(_dashRamp.playerAction);
        if (_dashRamp.playerAction == PlayerStateQTEKeys) {
            dashrnear = instance_nearest(x, y + 1, objDashRamp);
            with (instance_create(0, 0, objEventQTEKeys)) {
                ownerID = other.id;
                qteFailedXSpeed = other.dashrnear.qteFailedXSpeed
                qteFailedYSpeed = other.dashrnear.qteFailedYSpeed
            }
        }
        PlayerSetAngle(0);
        AnimationApply("LAUNCH");
        xDirection = _dashRamp.image_xscale;

        allowKeysTimer = 40;

        interactDelay = 10;

        PlaySound("snd/DashRamp");
    }
}
