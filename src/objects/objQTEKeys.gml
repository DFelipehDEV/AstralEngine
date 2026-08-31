#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
image_alpha = 0;

qteTimer = 0;
qteWon = 0;

hudBackScale = 0;

hudInput[0] = choose(0, 1, 2);
hudInput[1] = choose(0, 1, 2);
hudInput[2] = choose(0, 1, 2);
hudInputCounter = 0;
hudInputScale[0] = 0;
hudInputScale[1] = 0;
hudInputScale[2] = 0;
hudTimerColor = make_color_rgb(0, 115, 255);
hudTimer = 100;

player = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation
qteTimer += 1;

if (qteTimer < 60) exit;

if (qteWon == 0) {
    if (hudTimer > -100) {
        // HUD animations
        image_alpha = min(image_alpha + 0.05, 0.8);
        if (image_alpha >= 0.7) {
            hudBackScale = min(hudBackScale + 0.05, 1);

            if (hudBackScale > 0.95) {
                var i;
                for (i = hudInputCounter; i < 3; i += 1) {
                    hudInputScale[i] = min(hudInputScale[i] + 0.2, 1);
                }
                hudTimer -= 2.8;
            }
        }

        // Shrink already-pressed keys
        var i;
        for (i = 0; i < hudInputCounter; i += 1) {
            hudInputScale[i] = max(hudInputScale[i] - 0.3, 0);
        }
    } else {
        // The player has failed the quick time event
        image_alpha = max(image_alpha - 0.1, 0);
        hudBackScale = max(hudBackScale - 0.2, 0);
        global.timeScale = min(global.timeScale + 0.2, 1);

        if (!audio_isplaying(sndPlayerHurt)) {
            PlaySound(sndPlayerHurt);
        }
        if (image_alpha <= 0.1) {
            if (instance_exists(player)) {
                with (player) {
                    StatesSet(PlayerStateAir);
                    AnimationPlay(choose("HOMED", "HOMED_2", "TRICK_VER"));
                    xSpeed = other.failedXSpeed;
                    ySpeed = other.failedYSpeed;
                    lockKeysTimer = 50;
                }
            }
            instance_destroy();
        }
    }
} else {
    image_alpha = max(image_alpha - 0.1, 0);
    hudBackScale = max(hudBackScale - 0.2, 0);
    global.timeScale = min(global.timeScale + 0.2, 1);

    if (image_alpha == 0) {
        instance_destroy();
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs
if (qteWon == 0 && image_alpha > 0.7 && hudInputCounter < 3) {
    if (sysinput_get_pressed("qte_" + string(hudInput[hudInputCounter]))) {
        hudInputCounter += 1;
        PlaySound(sndQTEPress);

        if (hudInputCounter >= 3) {
            qteWon = 1;
            PlaySound(sndQTEWin);

            if (instance_exists(player)) {
                with (player) {
                    StatesSet(PlayerStateAir);
                    AnimationPlay("HOMED");
                    lockKeysTimer = 60;
                    PlayVoice(voiceline[8]);
                }
            }
            hudInputScale[2] = 0.5;
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
BeginUI();

// Draw underlay
draw_set_alpha(image_alpha);
draw_rectangle_color(0, 0, ScreenWidth, ScreenHeight, c_black, c_black, c_black, c_black, 0);

draw_sprite_ext(sprQTEKeysBack, 0, ScreenWidthHalf, ScreenHeightHalf - 30, hudBackScale, hudBackScale, 0, c_white, image_alpha);
draw_rectangle_color(ScreenWidthHalf - 100, ScreenHeightHalf - 11, ScreenWidthHalf + hudTimer, ScreenHeightHalf + 11, hudTimerColor, hudTimerColor, hudTimerColor, hudTimerColor, 0);
draw_set_alpha(1);
draw_sprite_ext(sprQTETimer, 0, ScreenWidthHalf, ScreenHeightHalf, hudBackScale, hudBackScale, 0, c_white, image_alpha);

var i;
for (i = 0; i < 3; i += 1) {
    InputIconDraw("qte_" + string(hudInput[i]), (i * 24) + ScreenWidthHalf - 24, ScreenHeightHalf - 30, hudInputScale[i], hudInputScale[i]);
}

EndUI();
