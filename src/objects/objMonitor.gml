#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

image_speed = 0;

icon = 0;     // Current icon
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
