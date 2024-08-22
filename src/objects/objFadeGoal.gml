#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
color = c_black;
image_alpha = 0;
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
/// Fade and create results

image_alpha += 0.03;

if (image_alpha >= 1) {
    instance_destroy();
    instance_create(0, 0, objEventResults);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw fade

draw_set_alpha(image_alpha);
draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + ScreenWidth, view_yview[0] + ScreenHeight, color, color, color, color, 0);
draw_set_alpha(1);
