#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Kill
with (other) {
    if (state != PlayerStateDead) {
        StatesSet(PlayerStateDead);
    }
}
