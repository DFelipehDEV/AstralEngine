/// PlayerBoost(aircanBoost)

var _aircanBoost;
_aircanBoost = argument0;

// Check if the player is not colliding with a wall
if (!terrainPushing) {
    if (energy > 0) {
        // Trigger boost dash
        if (keySpecial1Pressed && !boosting) {
            PlayVoice(choose("snd/noone", voiceline[0], voiceline[1]));
            PlaySound("snd/PlayerBoostStart")

            DummyEffectCreate(x, y, sprBoostWave, 0.4, 0, -0.01, bm_normal, 1, xDirection, 1, animationAngle);

            // Decrease energy gauge
            PlayerAddEnergy(-1.5);

            // Speed up the player
            if abs(xSpeed) < boostStartSpeed {
                xSpeed = boostStartSpeed * xDirection;
            }

            with (cam) {
                CameraLag(20);
                CameraShakeY(20);
            }

            instance_create(x, y, objBoostShockwave);

            // Check if the player is in the air
            if (!ground && (_aircanBoost)) {
                // Air boost dash
                boosting = true;
                PlayerSetAction(PlayerActionBoostAir);

                if (boostAura == noone) {
                    boostAura = instance_create(x, y, objBoost);
                    with (boostAura) {
                        sprite_index = other.boostSprite;
                        image_angle = point_direction(other.xprevious, other.yprevious, x, y);
                        ownerID = other.id;
                        image_alpha = 0.7;
                    }
                }
                // Update player's physics to the boost physics
                PlayerPhysicModeSet(physicsMode);
            }
            else {
                canBoost = true;
            }
        }

        // Keep boosting
        if (keySpecial1 && canBoost) {
            boosting = true;
            trailTimer = 120;

            if (boostAura == noone) {
                boostAura = instance_create(x, y, objBoost);
                with (boostAura) {
                    sprite_index = other.boostSprite;
                    image_angle = point_direction(other.xprevious, other.yprevious, x, y);
                    ownerID = other.id;
                    image_alpha = 0.7;
                }
            }
            // Decrease energy gauge    
            PlayerAddEnergy(-0.35);
            
            // Update player's physics to the boost physics
            PlayerPhysicModeSet(physicsMode);
        }
    }
    else {
        // Alert the player that he can't boost
        if (keySpecial1Pressed && !boosting) {
            // Create charge effect
            with (instance_create(x, y, objSpindashCharge)) {
                image_xscale = 0.0006;
                image_yscale = 0.0006;
                scalespeed = 0.2;
            }
            // Shake the energy gauge
            hud.shakeTimer = 30;
            PlayVoice(voiceline[2]);
        }
    }   
}
