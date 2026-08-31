#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
pull = false;
player = noone;
pullSound = -1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pull
if (pull) {
    var _dir;
    _dir = point_direction(x, y, crane.x, crane.y);
    hspeed = lerp(hspeed, 10 * dcos(_dir), 0.1 * global.timeScale)
    vspeed = lerp(vspeed, 10 * -dsin(_dir), 0.1 * global.timeScale);
    player.x = x;
    player.y = y + 12;

    if (place_meeting(x, y, crane)) {
        pull = false;
        hspeed = 0;
        vspeed = 0;
        with (player) {
            ySpeed = -6.5;
            StatesSet(PlayerStateSpring);
            AnimationPlay("SPRING");
            canMove = true;
        }
        if (!audio_isplaying(sndPlayerJump)) {
            PlaySound(sndPlayerJump);
        }
        audio_stop(pullSound);
        pullSound = -1;
        exit;
    } else {
        if (pullSound == -1) {
            pullSound = PlaySound(sndHandleMove, 1, 1, true);
        }
    }
}
else {
    // Return to original position
    x = approach(x, xstart, 6 * global.timeScale);
    y = approach(y, ystart, 6 * global.timeScale);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field crane: instance
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw handle
var _ang;
_ang = point_direction(crane.x, crane.y, x, y);

draw_sprite_ext(sprHandleLine, 0, floor(x), floor(y), image_xscale, -distance_to_point(crane.x + 6 * dsin(_ang), crane.y - 6 * dcos(_ang)), _ang + 90, image_blend, image_alpha);
draw_self();
