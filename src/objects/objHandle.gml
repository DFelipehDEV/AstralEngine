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
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pull
if (pull) {
    // Check if we have reached the crane
    if (place_meeting(x, y, crane)) {
        pull = false;
        hspeed = 0;
        vspeed = 0;
        with (player) {
            ySpeed = -6;
            StatesSet(PlayerStateAir);
            AnimationApply("LANDING");
            y -= 16;
            canMove = true;
        }
        if (!audio_isplaying(sndPlayerJump)) {
            PlaySound(sndPlayerJump);
        }
        audio_stop(sndHandleMove);
        exit;
    } else {
        if (!audio_isplaying(sndHandleMove)) {
            PlaySound(sndHandleMove, 1, 1, true);
        }
    }

    var _dir;
    _dir = point_direction(x, y, crane.x, crane.y);

    hspeed = lerp(hspeed, 10 * dcos(_dir), 0.1)
    vspeed = lerp(vspeed, 10 * -dsin(_dir), 0.1);
    player.x = x;
    player.y = y + 12;
}
else {
    // Return to original position
    x = approach(x, xstart, 6);
    y = approach(y, ystart, 6);
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
