#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

event_inherited();

StatesInit(BuzzerStateNormal);
target = noone;

shootTimer = 20;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (canMove) {
    x += xSpeed * global.timeScale;
    y += ySpeed * global.timeScale;
}

StatesUpdate();
