#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
ySpeed = -3;
ownerIDRewarded = false;

ownerID = noone;
image_speed = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Disappear and give reward.

if (ySpeed < 0) {
    y      += ySpeed;
    ySpeed += 0.09375;
}

if (ySpeed >= 0 && ownerIDRewarded == false) {
    ySpeed = 0;
    ownerIDRewarded = true;
    event_user(0);
}

// Fade
if (ownerIDRewarded == true) {
    if (image_alpha <= 0) {
        instance_destroy();
    }

    image_alpha -= 0.1;
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
        with (ownerID) {
            PlayerHurt();
        }
        break;


    // 5 Rings
    case 2:
        global.playerRings += 5;
        PlaySoundSingle(sndRingMonitor, global.soundVolume, 1);
        break;


    // 10 Rings
    case 3:
        global.playerRings += 10;
        PlaySoundSingle(sndRingMonitor, global.soundVolume, 1);
        break;


    // Random rings
    case 4:
        global.playerRings += irandom_range(1, 25);
        PlaySoundSingle(sndRingMonitor, global.soundVolume, 1);
        break;


    // Energy up
    case 5:
        with (ownerID) {
            PlayerAddEnergy(80);
            PlaySoundSingle(sndTrick, global.soundVolume, 1);
        }
        break;


    // Normal shield
    case 6:
        with (ownerID) {
            PlayerSetShield(ShieldNormal);
            PlaySoundSingle(sndShieldMonitor, global.soundVolume, 1);
        }
        break;


    // Electricity shield
    case 7:
        with (ownerID) {
            PlayerSetShield(ShieldElectricity);
            PlaySoundSingle(sndShieldMonitor, global.soundVolume, 1.1);
        }
        break;

    // Invincibility
    case 9:
        with (ownerID) {
            invincibility = InvincibilityMonitor;
            invincibilityTimer = 1150;
            starTimer = invincibilityTimer;
        }
        audio_music_pause();
        audio_play_single(bgmInvincibility);
        break;

    // Combine ring
    case 10:
        with (ownerID) {
            combineActive = true;
        }
        PlaySoundSingle(sndRingMonitor, global.soundVolume, 0.75);
        break;
}

ownerIDRewarded = true;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw icon

draw_sprite_ext(sprMonitorIcons, icon, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
