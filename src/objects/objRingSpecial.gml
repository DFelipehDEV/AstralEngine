#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

image_speed = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation speed

image_index = global.gameTime div 40;

image_angle = global.roomTick*2;
if (distance_to_object(objPlayer) < 140) {
    image_xscale = min(lerp(image_xscale, 1 - floorto(abs(objPlayer.x - x)/300, 0.15), 0.2), 1);
    image_yscale = image_xscale;
}
else {
    image_xscale = max(image_xscale - 0.05, 0);
    image_yscale = image_xscale;
}
