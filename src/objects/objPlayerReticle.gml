#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

scale = 5;

creationTimer = 0;

angle[0] = 0;
angle[1] = 0;

ownerID = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (instance_exists(target)) {
    x = lerp(x, target.x, 0.4);
    y = lerp(y, target.y, 0.4);
}
creationTimer = min(creationTimer + 1, 20);
scale = ease(creationTimer, 5, -4, 20, "OutBack");

if (creationTimer == 4) {
    PlaySound("snd/LockOn");
}
if (creationTimer > 15) {
    angle[0] += 1;
    angle[1] += 4;
}


if (!ownerID.homingPossible || distance_to_object(ownerID) > 210 || ownerID.y > y + 5|| distance_to_object(ownerID) < 4 || ownerID.ground || place_meeting(x, y, ownerID)) {
    instance_destroy();
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
