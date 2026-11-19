#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
smokeXSpeedMin = -1.5;
smokeXSpeedMax = 1.5;
smokeYSpeedMin = -0.4;
smokeYSpeedMax = -0.2;
smokeScaleMin = 1.9;
smokeScaleMax = 2.1;
smokeFadeSpeed = 0.015;
smokeAnimSpeed = 0.075;
smokeYOffset = -20;

smokes = dss_list_create();
smokesFrequency = 3;
smokesStep = smokesFrequency;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
draw_set_blend_mode(bm_add);
DrawSpriteQuad(x, y, x + sprite_width, y, x, y + sprite_height, x + sprite_width, y + sprite_height, sprite_index,
                World.gameTime * 0.03, 1, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_normal);

if (place_meeting(x, y + 4, objWater)) {
    smokesStep -= global.timeScale;
    if (smokesStep <= 0) {
        var _randScale, _centerX, _newSmoke;
        _randScale = random_range(smokeScaleMin, smokeScaleMax);
        _centerX = sprite_width/2;

        _newSmoke = CreateDummy((x + _centerX) + random_range(-_centerX, _centerX), y + sprite_height + smokeYOffset,
                    sprDust, smokeAnimSpeed * global.timeScale, 0, choose(depth - 1, depth + 1), bm_add, 0.95, _randScale, _randScale, 0);
                    ds_list_add(smokes, _newSmoke)
        with (_newSmoke) {
            hspeed = random_range(other.smokeXSpeedMin, other.smokeXSpeedMax) * global.timeScale;
            vspeed = random_range(other.smokeYSpeedMin, other.smokeYSpeedMax) * global.timeScale;
        }
        smokesStep = smokesFrequency;
    }

    var i, _smoke;
    for (i = 0; i < ds_list_size(smokes); i += 1) {
        _smoke = ds_list_find_value(smokes, i);
        instance_activate_object(_smoke);
        with (_smoke) {
            image_alpha -= other.smokeFadeSpeed * global.timeScale;
            if (image_alpha <= 0) {
                instance_destroy();
                ds_list_pop_first(other.smokes);
            }
        }
    }
}
