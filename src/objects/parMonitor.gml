#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

image_speed = 0;

icon = 0;     // Current icon
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

monIcon = instance_create(x, y, objMonitorIcon);
monIcon.ownerID = other.id;
monIcon.icon = icon;

if (other.action == PlayerActionJump && other.ySpeed > 0) {
    other.ySpeed *= -0.9;
}
with (other) {
    PlayerHomingReset(PlayerActionHomingFlight, 0, -6.7, 0, x, y);
}

// Create explosion
DummyEffectCreate(x, y, sprVFXExplosion1, 0.35, 0, -0.1, bm_normal, 1, 1, 1, 0);
PlaySoundSingle("sndExplosion1", global.volumeSounds, 1);
PlaySoundSingle("sndMonitorBreak", global.volumeSounds, 1);
instance_destroy();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Preview
/*preview
draw_sprite(Sprite("sprMonitorIcons", 0), 0, x, y);
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw monitor and icon

draw_sprite(sprMonitorIcons, icon, x, y);
draw_sprite(sprMonitor, 0, x, y);
