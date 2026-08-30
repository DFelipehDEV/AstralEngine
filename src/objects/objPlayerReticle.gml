#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
scale = 5;

creationTimer = 0;
lockOnSound = -1;

angle[0] = 0;
angle[1] = 0;

target = noone;
destroyed = false;
#define Step_1
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
creationTimer = min(creationTimer + global.timeScale, 20);
scale = ease(creationTimer, 5, -4, 20, "OutBack");

if (creationTimer > 10) {
    if (lockOnSound == -1) lockOnSound = PlaySound(sndLockOn, 1, 0.95);
}

if (creationTimer > 15) {
    angle[0] += global.timeScale;
    angle[1] += 4 * global.timeScale;
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
