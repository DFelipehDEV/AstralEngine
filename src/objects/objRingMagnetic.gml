#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
attractAcc[0] = 0.85;
attractAcc[1] = 0.2875;

image_speed = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation speed and attration

image_index = global.gameTime div 80;

if (instance_exists(ownerID)) {
    signPlayerX = sign(ownerID.x - x);
    signPlayerY = sign(ownerID.y - y);

    movX = (sign(hspeed) == signPlayerX);
    movY = (sign(vspeed) == signPlayerY);

    hspeed += attractAcc[movX] * signPlayerX;
    vspeed += attractAcc[movY] * signPlayerY;
}
