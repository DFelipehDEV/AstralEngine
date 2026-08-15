#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sysTime.gameTimeAllow = true;
        sysTime.gameTime = 0;
        sysTime.timeScale = 1;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (GameStateGet(GameStatePaused)) exit;

        if (sysTime.gameTimeAllow) {
            sysTime.gameTime += 1000 / 60 * sysTime.timeScale;
        }
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sysTime.gameTimeAllow = true;
        sysTime.gameTime = 0;
        sysTime.timeScale = 1;
