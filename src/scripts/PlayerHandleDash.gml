/// PlayerHandleDash()

var _dashPad, _dashRing, _dashRamp;
_dashPad = PlayerCollisionHitbox(x, y, objDashPad);
if (_dashPad != noone) {
    if (!PlayerCollisionHitbox(xprevious, yprevious, _dashPad)) {
        if (pushingWall && !ground) {
            PlayerSetGround(true);
            PlayerSetAngle(_dashPad.image_angle);
            ySpeed = 0;
        }

        if (_dashPad.strength != 0) {
            xSpeed = _dashPad.strength * _dashPad.image_xscale;
        }

        DummyEffectCreate(x, y, sprDashDust, 0.25, 0, -0.1, bm_normal, 1, _dashPad.image_xscale, _dashPad.image_yscale, _dashPad.image_angle);
        PlaySound(sndDashPad);
    }
}

_dashRing = PlayerCollisionHitbox(x, y, objDashRing);
if (_dashRing != noone) {
    if (!PlayerCollisionHitbox(xprevious, yprevious, _dashRing)) {
        xSpeed = _dashRing.strength * dcos(_dashRing.image_angle+90);
        ySpeed = -_dashRing.strength * dsin(_dashRing.image_angle+90);
        x = _dashRing.x;
        y = _dashRing.y;

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

        StatesSet(_dashRing.playerAction);
        PlayerSetAngle(0);
        PlayerSetGround(false);

        _dashRing.scale = 0.5;

        allowKeysTimer = 15;

        PlaySound(_dashRing.interactSound);
    }
}

_dashRamp = PlayerCollisionObjectBottom(x, y, angle, maskBig, objDashRamp);
if (_dashRamp != noone && ground) {
    if (!PlayerCollisionObjectBottom(xprevious, yprevious, _dashRamp)) {
        if (_dashRamp.xStrength != 0) {
            xSpeed = _dashRamp.xStrength * _dashRamp.image_xscale;
        }

        if (_dashRamp.yStrength != 0) {
            ySpeed = _dashRamp.yStrength;
            PlayerSetGround(false);
        }

        if (_dashRamp.playerAction == PlayerStateQTEKeys) {
            StatesSet(PlayerStateQTEKeys, _dashRamp.qteFailedXSpeed, _dashRamp.qteFailedYSpeed);
        } else {
            StatesSet(_dashRamp.playerAction);
        }

        PlayerSetAngle(0);
        AnimationApply("LAUNCH");

        xDirection = _dashRamp.image_xscale;
        x = _dashRamp.x;
        y = _dashRamp.y - 22;

        allowKeysTimer = 30;

        PlaySound(sndDashRamp);
    }
}
