#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

// Destroy after repeattimes ended
if (repeatTimes == 0) {
    instance_destroy();
}
else {
    repeatTimes -= 1;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw effect

draw_set_blend_mode(blendMode);
draw_self();
draw_set_blend_mode(bm_normal);
