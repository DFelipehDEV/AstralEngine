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

if (other.state == PlayerStateJump && other.ySpeed > 0) {
    other.ySpeed *= -0.9;
}
with (other) {
    PlayerHomingReset(PlayerStateHomingFlight, 0, -6.7, 0, x, y);
}

// Create explosion
DummyEffectCreate(x, y, sprExplosion, 0.35, 0, -0.1, bm_normal, 1, 1, 1, 0);
PlaySoundSingle(sndExplosion, global.soundVolume, 1);
PlaySoundSingle(sndMonitor, global.soundVolume, 1);
instance_destroy();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Preview
//field icon: value
/*preview
    if (!FieldDefined("icon")) exit;

    var _index;
    _index = Field("icon")

    draw_sprite(Sprite("sprMonitorIcons", _index), 0, x, y);
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
