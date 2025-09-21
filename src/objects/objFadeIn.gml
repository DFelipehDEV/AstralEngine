#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
image_blend = c_black;
image_alpha = 1;
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
/// Fade and go to the room

image_alpha -= 0.05;

if (image_alpha <= 0) {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw fade

draw_set_alpha(image_alpha);
draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + ScreenWidth, view_yview[0] + ScreenHeight, image_blend, image_blend, image_blend, image_blend, 0);
draw_set_alpha(1);
