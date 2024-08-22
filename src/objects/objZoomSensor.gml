#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

zoom = 1;
value = global.zoom;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Check collision

with (objPlayer) {
    // Check if the player is touching a sensor
    if (place_meeting(x, y, other)) {
        // Set zoom
        global.zoomValue = other.zoom;
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
/*preview
*/
//field zoom: value
