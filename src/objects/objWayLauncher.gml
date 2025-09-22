#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

image_speed = 0;

dir = 0.01;
launcherDir = 0.01;
player = noone;
timerExit = 0; // Time until the player is kicked out of the launcher
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Launch


if (player == noone) {
    if (timerExit > 0) {
        timerExit -= 1;
    }
    image_index = max(image_index - 0.3, 0);
    if (image_index == 0) {
        launcherDir = dir;
    }
} else {
    if (timerExit < 60) {
        timerExit += 1;
    }
    else {
        // After the timer ends, kick out player
        with (player) {
            visible = true;
            PlayerSetState(PlayerStateHurt);
        }
        dir = 0.01;
        player = noone;
        audio_stop(sndWayLauncherWait);
        PlaySound(sndWayLauncherLaunch, 1, 0.85);
        exit;
    }

    // Up Direction
    if (player.keyUp) {
        if (dir != 0) {
            dir = 0;
            PlaySound(sndWayLauncherChangeDir);
        }
    } else if (player.keyDown) {
        if (dir != 180) {
            dir = 180;
            PlaySound(sndWayLauncherChangeDir);
        }
    } else if (player.keyLeft) {
        if (dir != 90) {
            dir = 90;
            PlaySound(sndWayLauncherChangeDir);
        }
    } else if (player.keyRight) {
        if (dir != 270) {
            dir = 270;
            PlaySound(sndWayLauncherChangeDir);
        }
    } else {
        dir = 0.01;
    }

    if (dir == 0.01) {
        image_index = max(image_index - 0.3, 0);
    } else {
        image_index = min(image_index + 0.3, 1.8);
        launcherDir = dir;

        // Launch
        if (player.keyActionPressed) {
            with (player) {
                PlayerSetState(PlayerStateSpring);
                xSpeed = 9 * -dcos(other.dir - 90);
                ySpeed = 9 * dsin(other.dir - 90);
                xDirection = 1;

                noGravityTimer = 15;

                starTimer = 40;

                audio_stop(sndWayLauncherWait);
                PlaySound(sndTrick);
                PlaySound(sndWayLauncherLaunch);
                visible = true;
            }
            dir = 0.01;
            player = noone;
        }
    }

}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw launcher

// Draw timer
draw_circle_color(x - 1, y - 1, 13, c_gray, c_gray, 0);
DrawCircularBar(x, y, 3, 10, 40, 40 - timerExit*0.58, 0, 360, 1, c_aqua);

// Draw launcher
draw_sprite_ext(sprWayLauncher, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (image_index > 0)
    draw_sprite_ext(sprWayLauncherDirection, round(image_index), x, y, image_xscale, image_yscale, image_angle + launcherDir, image_blend, image_alpha);
draw_sprite_ext(sprWayLauncher, 1, x, y, image_xscale, image_yscale, round((image_angle + timerExit*8)/12)*12, image_blend, image_alpha);
