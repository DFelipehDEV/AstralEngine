#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

image_speed = 0;
timerExit= 0; // Time until the player is kicked out of the launcher
directionChosen = 0; // Direction the player is holding  Right - 1, Bottom - 2, Left - 3, Top - 4, NoDirection - 0
active = false; // Whether or not the player is inside the launcher

ownerID = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Launch

directionChosen = 0;
if (ownerID == noone) exit;

// Check if is colliding with the player
if (ownerID.action == PlayerActionWaylauncher && active) {
    if (timerExit < 140) {
        timerExit += 1;
    }
    else {
        // After the timer ends, kick out player
        active = false;
        with (ownerID) {
            visible = true;
            PlayerSetAction(PlayerActionHurt);
        }
        sound_stop("snd/WayLauncherWait");
        PlaySoundExt("snd/WayLauncherLaunch", global.volumeSounds, 0.85, false);
    }

    // Up Direction
    if (ownerID.keyUp && !ownerID.keyDown && !ownerID.keyLeft && !ownerID.keyRight) {
        directionChosen = 4;
    }

    // Down Direction
    if (ownerID.keyDown && !ownerID.keyUp && !ownerID.keyLeft && !ownerID.keyRight) {
        directionChosen = 2;
    }

    // Left Direction
    if (ownerID.keyLeft && !ownerID.keyUp && !ownerID.keyDown && !ownerID.keyRight) {
        directionChosen = 3;
    }

    // Right Direction
    if (ownerID.keyRight && !ownerID.keyUp && !ownerID.keyLeft && !ownerID.keyDown) {
        directionChosen = 1;
    }
}
else {
    if (timerExit > 0) {
        timerExit -= 2;
    }
}

switch (directionChosen) {
    // NoDirection
    case 0:
        // Return to sprite without direction
        if (floor(image_index) == 0) {
            sprite_index = sprWayLauncher;
        }
        else {
            image_index -= 0.4;
        }
        break;

    // Top
    case 4:
        if (sprite_index != sprWayLauncherUp) {
            sprite_index = sprWayLauncherUp;
            image_index = 0;
            PlaySound("snd/WayLauncherChangeDir");
        }

        // Animation
        if (image_index < sprite_get_number(sprite_index) - 1) {
            image_index += 0.35;
        }

        // Launch
        if (floor(image_index) == 3) {
            image_speed = 0;
            if (ownerID.keyActionPressed) {
                active = false;
                with (ownerID) {
                    PlayerSetAction(PlayerActionSpring);
                    ySpeed = -9.5;
                    visible = true;
                    starTimer = 50;
                    allowKeysTimer = 17;

                    sound_stop("snd/WayLauncherWait");
                    PlaySound("snd/Trick");
                    PlaySound("snd/WayLauncherLaunch");
                }
            }
        }
        break;

    // Down
    case 2:
        if (sprite_index != sprWayLauncherDown) {
            sprite_index = sprWayLauncherDown;
            image_index = 0;
            PlaySound("snd/WayLauncherChangeDir");
        }

        // Animation
        if (image_index < sprite_get_number(sprite_index) - 1) {
            image_index += 0.35;
        }

        // Launch
        if (floor(image_index) == 3) {
            image_speed = 0;
            if (ownerID.keyActionPressed) {
                active = false;
                with (ownerID) {
                    PlayerSetAction(PlayerActionNormal);
                    ySpeed = 9.5;
                    visible = true;
                    starTimer = 50;
                    allowKeysTimer = 17;

                    sound_stop("snd/WayLauncherWait");
                    PlaySound("snd/Trick");
                    PlaySound("snd/WayLauncherLaunch");
                }
            }
        }
        break;

    // Left
    case 3:
        if (sprite_index != sprWayLauncherLeft) {
            sprite_index = sprWayLauncherLeft;
            image_index = 0;
            PlaySound("snd/WayLauncherChangeDir");
        }

        // Animation
        if (image_index < sprite_get_number(sprite_index) - 1) {
            image_index += 0.35;
        }

        // Launch
        if (floor(image_index) == 3) {
            image_speed = 0;
            if (ownerID.keyActionPressed) {
                active = false;
                with (ownerID) {
                    PlayerSetAction(PlayerActionNormal);
                    xDirection = -1;
                    AnimationApply("LAUNCH");
                    yStuckTimer = 16;
                    xSpeed = -9;
                    visible = true;
                    starTimer = 50;
                    allowKeysTimer = 17;

                    sound_stop("snd/WayLauncherWait");
                    PlaySound("snd/Trick");
                    PlaySound("snd/WayLauncherLaunch");
                }
            }
        }
        break;

    // Right
    case 1:
        if sprite_index != sprWayLauncherRight {
            sprite_index = sprWayLauncherRight;
            image_index = 0;
            PlaySound("snd/WayLauncherChangeDir");
        }

        // Animation
        if (image_index < sprite_get_number(sprite_index) - 1) {
            image_index += 0.35;
        }

        // Launch
        if (floor(image_index) == 3) {
            image_speed = 0;
            if (ownerID.keyActionPressed) {
                active = false;
                with (ownerID) {
                    PlayerSetAction(PlayerActionNormal);
                    xDirection = 1;
                    AnimationApply("LAUNCH");
                    yStuckTimer = 16;
                    xSpeed = 9;
                    visible = true;
                    starTimer = 50;
                    allowKeysTimer = 17;

                    sound_stop("snd/WayLauncherWait");
                    PlaySound("snd/Trick");
                    PlaySound("snd/WayLauncherLaunch");
                }
            }
        }
        break;
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
DrawCircularBar(x, y, 3, 10, 40, 40 - timerExit*0.285, 0, 360, 1, c_aqua);

// Draw launcher
draw_self();
draw_sprite_ext(sprWayLauncher, 1, x, y, image_xscale, image_yscale, round((image_angle + timerExit*4)/8)*8, image_blend, image_alpha);
