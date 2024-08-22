#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Hide HUD
with (objPlayer) {
    // Check if we are in the sensor
    if (place_meeting(x, y, other)) {
        objControllerStage.hudHide = true;
    }
    else {
        // Check if we leaved the sensor
        if (place_meeting(xprevious, yprevious, other)) {
            objControllerStage.hudHide = false;
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*preview
*/
