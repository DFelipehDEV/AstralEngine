#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
smallBubbleTimer = 0;
bigBubbleTimer = 0;
image_speed = 0.15;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Generate
smallBubbleTimer += 1;
if (smallBubbleTimer == 110) {
    smallBubbleTimer = 0;
    instance_create(x, y, objWaterBubbleSmall);
}

bigBubbleTimer += 1;

if (bigBubbleTimer == 290) {
    instance_create(x, y, objWaterBubble);
    bigBubbleTimer = 0;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw generator
draw_set_blend_mode(bm_add)
draw_self();
draw_set_blend_mode(bm_normal)
