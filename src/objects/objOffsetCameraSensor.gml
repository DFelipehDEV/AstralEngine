#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

xOffset = 0;
yOffset = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle

var _cam;
_cam = instance_nearest(x, y, objCamera);
with (_cam) {
    // Check if we are in the sensor
    if (place_meeting(x, y, other)) {
        xOffset = other.xOffset;
        yOffset = other.yOffset;
    }
    else {
        // Check if we leaved the sensor
        if (place_meeting(xprevious, yprevious, other)) {
            xOffset = 0;
            yOffset = 0;
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field xOffset : number
//field yOffset : number
