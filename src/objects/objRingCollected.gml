#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///   Variables
rainbowScale = 0.1;
rainbowAlpha = 1;

yellowScale = 0.06;
yellowAlpha = 1;

sparkleAngle = 0;
sparkleOffset = 15;
createTimer = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate
rainbowScale += 0.025;
rainbowAlpha -= 0.07;

yellowScale  += 0.017;
yellowAlpha  -= 0.075;

sparkleAngle += 14;
createTimer += 1;

if (createTimer mod 4 == 2) {
    CreateDummy(x + dcos(sparkleAngle)*sparkleOffset, y - dsin(sparkleAngle)*sparkleOffset, choose(sprRingSparkle, sprRingSparkle2, sprRingSparkle3), 0.5, 0, 1, bm_normal, 1, 1, 1, 0)
}

if (createTimer > 30) {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw rings
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprRingRainbow, 0, floor(x), floor(y), rainbowScale, rainbowScale, 0, c_white, rainbowAlpha);
draw_sprite_ext(sprRingYellow, 0, floor(x), floor(y), yellowScale, yellowScale, 0, c_white, yellowAlpha);
draw_set_blend_mode(bm_normal);
