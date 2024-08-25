#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

global.gameTimeAllow = true;
global.gameTime = global.playerCheckTime;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Timer

if (global.gameTimeAllow) {
    global.gameTime += 1000 / 60 * global.deltaMultiplier;
}
