/// PlayerBoost(aircanBoost)
if (pushingWall) exit;

var _aircanBoost;
_aircanBoost = argument0;

if (energy > 0) {
    if (keyBoostPressed && !boosting) {
        PlayVoice(choose(sndNoone, voiceline[0], voiceline[1]));
        PlaySound(sndPlayerBoost);
        CreateDummy(x, y, sprBoostWave, 0.4, 0, -0.01, bm_normal, 1, xDirection, 1, image_angle);
        PlayerAddEnergy(-1.5);

        if (abs(xSpeed) < boostStartSpeed)
            xSpeed = boostStartSpeed * xDirection;

        with (cam) {
            CameraLag(16);
            CameraShakeY(20);
        }
        instance_create(x, y, objBoostShockwave);

        if (!ground && _aircanBoost) {
            boosting = true;
            boostAirTimer = 80;
            canBoost = true;
            StatesSet(PlayerStateAir);
            AnimationApply("LAUNCH");

            if (!instance_exists(boostAura)) {
                boostAura = instance_create(x, y, objBoost);
                with (boostAura) {
                    player = other.id;
                    sprite_index = other.boostSprite;
                    image_angle = point_direction(other.xprevious, other.yprevious, x, y);
                    image_alpha = 0.7;
                }
            }
            PlayerSetPhysicsMode(physicsMode);
        } else {
            canBoost = true;
        }
    }

    if (keyBoost && canBoost) {
        boosting = true;
        trailTimer = 120;

        if (!instance_exists(boostAura)) {
            boostAura = instance_create(x, y, objBoost);
            with (boostAura) {
                player = other.id;
                sprite_index = other.boostSprite;
                image_angle = point_direction(other.xprevious, other.yprevious, x, y);
                image_alpha = 0.7;
            }
        }

        PlayerAddEnergy(-0.35 * global.timeScale);
        PlayerSetPhysicsMode(physicsMode);
    }
} else if (keyBoostPressed && !boosting) {
    with (instance_create(x, y, objSpindashCharge)) {
        image_xscale = 0.0006;
        image_yscale = 0.0006;
        scalespeed = 0.2;
    }
    hud.shakeTimer = 30;
    PlayVoice(voiceline[2]);
}
