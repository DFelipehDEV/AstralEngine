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
    case 1:
        with (player) {
            PlayerHurt();
        }
        break;


    // 5 Rings
    case 2:
        player.rings += 5;
        PlaySoundSingle(sndRingMonitor);
        break;


    // 10 Rings
    case 3:
        player.rings += 10;
        PlaySoundSingle(sndRingMonitor);
        break;


    // Random rings
    case 4:
        player.rings += irandom_range(1, 25);
        PlaySoundSingle(sndRingMonitor);
        break;


    // Energy up
    case 5:
        with (player) {
            PlayerAddEnergy(80);
            PlaySoundSingle(sndTrick);
        }
        break;


    // Normal shield
    case 6:
        with (player) {
            PlayerSetShield(objShield);
            PlaySoundSingle(sndShieldMonitor);
        }
        break;


    // Electricity shield
    case 7:
        with (player) {
            PlayerSetShield(objShieldElectricity);
            PlaySoundSingle(sndShieldMonitor, 1, 1.1);
        }
        break;

    // Invincibility
    case 9:
        with (player) {
            invincibility = InvincibilityMonitor;
            invincibilityTimer = 1150;
            starTimer = invincibilityTimer;
        }
        audio_music_pause();
        audio_play_single(bgmInvincibility);
        break;

    // Combine ring
    case 10:
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
