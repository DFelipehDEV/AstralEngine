#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
roomTarget = -1;
alphaSpeed = 0.03;
delay = 0.5;
fadeOut = true;
image_alpha = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade and go to the room
if (fadeOut) {
    // Fade out
    image_alpha += alphaSpeed;

    if (image_alpha >= 1 + delay) {
        fadeOut = false;
        if (room_exists(roomTarget))
            room_goto(roomTarget);
    }
} else {
    // Fade in
    image_alpha -= alphaSpeed;

    if (image_alpha <= 0)
        instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw fade
BeginUI();

draw_set_alpha(image_alpha);
draw_rectangle_color(0, 0, ScreenWidth, ScreenHeight, image_blend, image_blend, image_blend, image_blend, 0);
draw_set_alpha(1);

EndUI();
