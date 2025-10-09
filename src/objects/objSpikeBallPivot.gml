#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
spikeBall = instance_create(x, y - 16, objSpikeBall);
spikeBallDistance = 80;
angle = 0;
angleSpeed = 2.5;
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
/// Rotate ball

if !instance_exists(spikeBall){ instance_activate_object(spikeBall) }

angle = (global.gameTime / 16.6)*angleSpeed;
spikeBall.x = x + dcos(angle)*spikeBallDistance;

// Calculate the scale factor based on the sine of the angle
var _scaleFactor;
_scaleFactor = 1 - 0.2 * dsin(angle);

// Apply the scale factor to the ball
spikeBall.image_xscale = _scaleFactor;
spikeBall.image_yscale = _scaleFactor;

spikeBall.image_blend = make_color_hsv(0, 0, floorto(255+_scaleFactor*180, 20))

if (distance_to_object(objCamera) < 350) {
    if (depth != sign(spikeBall.x - spikeBall.xprevious)) {
        PlaySound(sndFlail);
    }
}

depth = sign(spikeBall.x - spikeBall.xprevious);
spikeBall.canHurt = depth == 1;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field spikeBallDistance: value
//field angleSpeed: value
/*preview
draw_circle(x + dcos((current_time/20)*angleSpeed)*spikeBallDistance, y - 16, 12, 1)
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw

if !instance_exists(spikeBall) exit;

var _chainWidth, _chainAmount;
_chainWidth = 14;
// Calculate how many chains are needed
_chainAmount = floor(spikeBallDistance/_chainWidth);

// Draw chains
var i;
for (i = 1; i < _chainAmount; i += 1) {
    var _x;
    _x = x + dcos(angle)*(i*_chainWidth);

    draw_sprite_ext(sprChain, 0, _x, y - 16, spikeBall.image_xscale, spikeBall.image_yscale, image_angle, image_blend, image_alpha);
}

draw_self();
