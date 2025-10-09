#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
systems = ds_list_create();
application_surface_enable(ApplicationSurfacePost)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Run systems destroy event
var _sys;
for (_sys = 0; _sys < ds_list_size(systems); _sys += 1) {
    script_execute(ds_list_find_value(systems, _sys), ev_destroy);
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Run systems step event
var _sys;
for (_sys = 0; _sys < ds_list_size(systems); _sys += 1) {
    script_execute(ds_list_find_value(systems, _sys), ev_step);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Run systems room start event
var _sys;
for (_sys = 0; _sys < ds_list_size(systems); _sys += 1) {
    script_execute(ds_list_find_value(systems, _sys), ev_room_start);
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Run systems room end event
var _sys;
for (_sys = 0; _sys < ds_list_size(systems); _sys += 1) {
    script_execute(ds_list_find_value(systems, _sys), ev_room_end);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Run systems draw event
var _sys;
for (_sys = 0; _sys < ds_list_size(systems); _sys += 1) {
    script_execute(ds_list_find_value(systems, _sys), ev_draw);
}
