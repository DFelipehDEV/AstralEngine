#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

buttonKBM = 0;
buttonJoystick = 0;
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Button

if (instance_exists(objControllerStage)) {
    if (objControllerStage.hudButtonKBM == -1) {
        objControllerStage.hudButtonKBM = buttonKBM;
        objControllerStage.hudButtonJoystick = buttonJoystick;
        objControllerStage.hudButtonTimer = 80;
        instance_destroy();
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
/*preview
*/
//field buttonKBM: number
//field buttonJoystick: number
