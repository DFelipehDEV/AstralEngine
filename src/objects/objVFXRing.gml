#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///   Variables

rainbowScale = 0.1;     // Rainbow ring scale
rainbowAlpha = 1;       // Rainbow ring alpha

yellowScale = 0.06;     // Yellow ring scale
yellowAlpha = 1;        // Yellow ring alpha

sparkleAngle = 0;
sparkleOffset = 15;
createTimer = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Increase scale/size and destroy

// Destroy
if (createTimer > 30) {
    instance_destroy();
}

// Increase scale/size
rainbowScale += 0.025;
rainbowAlpha -= 0.07;

yellowScale  += 0.017;
yellowAlpha  -= 0.075;

sparkleAngle += 14;
createTimer += 1;

if (createTimer mod 4 == 2) {
    DummyEffectCreate(x + dcos(sparkleAngle)*sparkleOffset, y - dsin(sparkleAngle)*sparkleOffset, choose(sprVFXRingSparkle1, sprVFXRingSparkle2, sprVFXRingSparkle3), 0.5, 0, 1, bm_normal, 1, 1, 1, 0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw rings

draw_set_blend_mode(bm_add);
// Rainbow ring
draw_sprite_ext(sprVFXRingRainbow, 0, floor(x), floor(y), rainbowScale, rainbowScale, 0, c_white, rainbowAlpha);
// Yellow ring
draw_sprite_ext(sprVFXRingYellow, 0, floor(x), floor(y), yellowScale, yellowScale, 0, c_white, yellowAlpha);
draw_set_blend_mode(bm_normal);
