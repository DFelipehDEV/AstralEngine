#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
WorldInputInit();
WorldTimeInit();
WorldDeactivationInit();
WorldWindowInit();

if (!test_is_stub()) {
    WorldDebugInit();
    WorldLogInit();
}
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!test_is_stub()) {
    WorldLogCleanup();
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (GameStateGet(GameStatePaused)) exit;

WorldTimeUpdate();
WorldDeactivationUpdate();
WorldWindowUpdate();
if (!test_is_stub()) {
    WorldDebugUpdate();
    WorldLogUpdate();
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
WorldTimeReset();
WorldDeactivationReset();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!test_is_stub()) {
    if (debug_mode) WorldDeactivationDraw();
    WorldDebugDraw();
    WorldLogDraw();
}
