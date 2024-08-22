#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

activated = false; //Checks if the player has pass throught the Checkpoint

image_speed = 0.3;
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Repeat animation

// If the player has passed the checkpoint and the animation ended, back to the start spin frame
if (activated) {
    image_index = 12;
}
