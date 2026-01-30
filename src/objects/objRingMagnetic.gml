#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
event_inherited();
MarkAsActive();
attractAcc[0] = 0.85;
attractAcc[1] = 0.2875;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Attration
event_inherited();
if (instance_exists(target)) {
    var _signPlayerX, _signPlayerY;
    _signPlayerX = sign(target.x - x);
    _signPlayerY = sign(target.y - y);

    hspeed += (attractAcc[sign(hspeed) == _signPlayerX] * _signPlayerX) * global.timeScale;
    vspeed += (attractAcc[sign(vspeed) == _signPlayerY] * _signPlayerY) * global.timeScale;
}
