#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
image_speed = 0;
icon = MonitorRings10;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//override grid 32,32,0,0
//field icon: enum(MonitorRings10,MonitorRings5,MonitorRingsRandom,MonitorEnergy,MonitorShieldNormal,MonitorShieldElectro,MonitorInvincibility,MonitorCombine,MonitorHurt)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw monitor and icon
draw_sprite(sprMonitorIcons, icon, x, y);
draw_sprite(sprMonitor, 0, x, y);
