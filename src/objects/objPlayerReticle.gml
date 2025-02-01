#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
scale = 5;

creationTimer = 0;

angle[0] = 0;
angle[1] = 0;

ownerID = noone;
target = noone;
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
/// Animation

if (instance_exists(target)) {
    x = target.x;
    y = target.y;
} else {
    instance_destroy();
}
creationTimer = min(creationTimer + 1, 20);
scale = ease(creationTimer, 5, -4, 20, "OutBack");

if (creationTimer == 4) {
    PlaySound(sndLockOn);
}
if (creationTimer > 15) {
    angle[0] += 1;
    angle[1] += 4;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw target

draw_sprite_ext(sprite_index, 0, x, y, scale, scale, angle[0], image_blend, image_alpha);
draw_sprite_ext(sprite_index, 1, x, y, scale, scale, angle[1], image_blend, image_alpha);
