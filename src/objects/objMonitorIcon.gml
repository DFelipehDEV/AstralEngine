#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
image_speed = 0;

ySpeed = -3;
playerRewarded = false;

player = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate and reward
if (ySpeed < 0) {
    y      += ySpeed * global.timeScale;
    ySpeed += 0.09375 * global.timeScale;
}

if (ySpeed >= 0 && !playerRewarded) {
    ySpeed = 0;
    playerRewarded = true;
    event_user(0);
}

// Fade
if (playerRewarded) {
    image_alpha -= 0.1 * global.timeScale;
    if (image_alpha <= 0) {
        instance_destroy();
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Give reward
switch (icon) {
    // Hurt monitor
    case MonitorHurt:
        with (player) {
            PlayerHurt();
        }
        break;


    // 5 Rings
    case MonitorRings5:
        player.rings += 5;
        PlaySoundSingle(sndRingMonitor);
        break;


    // 10 Rings
    case MonitorRings10:
        player.rings += 10;
        PlaySoundSingle(sndRingMonitor);
        break;


    // Random rings
    case MonitorRingsRandom:
        player.rings += irandom_range(1, 25);
        PlaySoundSingle(sndRingMonitor);
        break;


    // Energy up
    case MonitorEnergy:
        with (player) {
            PlayerAddEnergy(energyMax);
            PlaySoundSingle(sndTrick);
        }
        break;


    // Normal shield
    case MonitorShieldNormal:
        with (player) {
            PlayerSetShield(objShield);
            PlaySoundSingle(sndShieldMonitor);
        }
        break;


    // Electricity shield
    case MonitorShieldElectro:
        with (player) {
            PlayerSetShield(objShieldElectricity);
            PlaySoundSingle(sndShieldMonitor, 1, 1.1);
        }
        break;

    // Invincibility
    case MonitorInvincibility:
        with (player) {
            invincibility = InvincibilityMonitor;
            invincibilityTimer = 1150;
            starTimer = invincibilityTimer;
        }
        audio_music_pause();
        audio_play_single(bgmInvincibility);
        break;

    // Combine ring
    case MonitorCombine:
        with (player) {
            combineActive = true;
        }
        PlaySoundSingle(sndRingMonitor, 1, 0.75);
        break;
}

playerRewarded = true;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw icon
draw_sprite_ext(sprMonitorIcons, icon, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
