/// PlayerBoost(aircanBoost)
if (!hasBoost || pushingWall) exit;

var _aircanBoost;
_aircanBoost = argument0;
if (!keyBoost) {
    canBoost = true;
}

if (energy > 0) {
    // Boost burst
    if (keyBoostPressed && !boosting && canBoost) {
        if (ground || (_aircanBoost && boostAirTimer > 0)) {
            boosting = true;

            PlayVoice(choose(voiceline[0], voiceline[1], -1));
            PlaySound(sndPlayerBoost);
            CreateDummy(x, y, sprBoostWave, 0.4, 0, -0.01, bm_normal, 1, xDirection, 1, image_angle);
            PlayerAddEnergy(boostEnergyPenalty * 2);

            if (abs(xSpeed) < boostStartSpeed) {
                xSpeed = boostStartSpeed * xDirection;
            }

            with (PlayerGetOwnedCamera()) {
                CameraLag(45 * other.xDirection);
                CameraShakeY(20);
            }

            instance_create(x, y, objBoostShockwave);

            if (!ground && _aircanBoost) {
                boostAirTimer = boostAirTimerMax;
                StatesSet(PlayerStateAir);
                AnimationPlay("LAUNCH");
            }

            if (!instance_exists(boostAura)) {
                boostAura = instance_create(x, y, objBoost);
                with (boostAura) {
                    player = other.id;
                    sprite_index = other.boostSprite;
                    image_angle = point_direction(other.xprevious, other.yprevious, x, y);
                }
            }
            PlayerSetPhysicsMode(physicsMode);
        }
    }

    if (ground) boostAirTimer = boostAirTimerMax;

    if (keyBoost && boosting) {
        trailTimer = 120;

        if (!instance_exists(boostAura)) {
            boostAura = instance_create(x, y, objBoost);
            with (boostAura) {
                player = other.id;
                sprite_index = other.boostSprite;
                image_angle = point_direction(other.xprevious, other.yprevious, x, y);
            }
        }

        PlayerAddEnergy(boostEnergyPenalty * global.timeScale);
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
