#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

inputs = true;

inputDevice[0] = 0;

joystick_set_deadzone(0.9);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

if (!inputs) exit;

// A B X Y LB RB Back Start LS RS
// Hold inputs
if (keyboard_check(vk_enter) || joystick_check_button(0, 7))
    inputDevice[0] |= (1 << InputStart);
else
    inputDevice[0] &= ~(1 << InputStart);

if (keyboard_check(vk_left) || joystick_axis(0, 0) < 0)
    inputDevice[0] |= (1 << InputLeft);
else
    inputDevice[0] &= ~(1 << InputLeft);

if (keyboard_check(vk_right) || joystick_axis(0, 0) > 0)
    inputDevice[0] |= (1 << InputRight);
else
    inputDevice[0] &= ~(1 << InputRight);

if (keyboard_check(vk_up) || joystick_axis(0, 1) < 0)
    inputDevice[0] |= (1 << InputUp);
else
    inputDevice[0] &= ~(1 << InputUp);

if (keyboard_check(vk_down) || joystick_axis(0, 1) > 0 || joystick_check_button(0, 1))
    inputDevice[0] |= (1 << InputDown);
else
    inputDevice[0] &= ~(1 << InputDown);

if (keyboard_check(ord("A")) || joystick_check_button(0, 0))
    inputDevice[0] |= (1 << InputAction);
else
    inputDevice[0] &= ~(1 << InputAction);

if (keyboard_check(ord("S")) || joystick_check_button(0, 2))
    inputDevice[0] |= (1 << InputSpecial1);
else
    inputDevice[0] &= ~(1 << InputSpecial1);

if (keyboard_check(ord("D")) || joystick_check_button(0, 1))
    inputDevice[0] |= (1 << InputSpecial2);
else
    inputDevice[0] &= ~(1 << InputSpecial2);

if (keyboard_check(ord("F")) || joystick_check_button(0, 3))
    inputDevice[0] |= (1 << InputSpecial3);
else
    inputDevice[0] &= ~(1 << InputSpecial3);


// Pressed inputs
if (keyboard_check_pressed(vk_enter) || joystick_check_button_pressed(0, 7))
    inputDevice[0] |= (1 << InputStartPressed);
else
    inputDevice[0] &= ~(1 << InputStartPressed);
if (keyboard_check_pressed(vk_left) || (joystick_axis(0, 0) < 0 && (inputDevice[0] & (1 << InputLeft)) == 0))
    inputDevice[0] |= (1 << InputLeftPressed);
else
    inputDevice[0] &= ~(1 << InputLeftPressed);

if (keyboard_check_pressed(vk_right) || (joystick_axis(0, 0) > 0 && (inputDevice[0] & (1 << InputRight)) == 0))
    inputDevice[0] |= (1 << InputRightPressed);
else
    inputDevice[0] &= ~(1 << InputRightPressed);

if (keyboard_check_pressed(vk_up) || (joystick_axis(0, 1) < 0 && (inputDevice[0] & (1 << InputUp)) == 0))
    inputDevice[0] |= (1 << InputUpPressed);
else
    inputDevice[0] &= ~(1 << InputUpPressed);

if (keyboard_check_pressed(vk_down) || (joystick_axis(0, 1) > 0 && (inputDevice[0] & (1 << InputDown)) == 0) || joystick_check_button_pressed(0, 1))
    inputDevice[0] |= (1 << InputDownPressed);
else
    inputDevice[0] &= ~(1 << InputDownPressed);

if (keyboard_check_pressed(ord("A")) || joystick_check_button_pressed(0, 0))
    inputDevice[0] |= (1 << InputActionPressed);
else
    inputDevice[0] &= ~(1 << InputActionPressed);

if (keyboard_check_pressed(ord("S")) || joystick_check_button_pressed(0, 2))
    inputDevice[0] |= (1 << InputSpecial1Pressed);
else
    inputDevice[0] &= ~(1 << InputSpecial1Pressed);

if (keyboard_check_pressed(ord("D")) || joystick_check_button_pressed(0, 1))
    inputDevice[0] |= (1 << InputSpecial2Pressed);
else
    inputDevice[0] &= ~(1 << InputSpecial2Pressed);

if (keyboard_check_pressed(ord("F")) || joystick_check_button_pressed(0, 3))
    inputDevice[0] |= (1 << InputSpecial3Pressed);
else
    inputDevice[0] &= ~(1 << InputSpecial3Pressed);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activate debug mode

if (keyboard_check_pressed(vk_caps)) {
    if (DEBUG == 1 && global.debug == false) {
        global.debug = true;
        PlaySound("snd/Ring");
        if (!instance_exists(objDebugMode))
            instance_create(0, 0, objDebugMode);
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset input

inputLeft = 0
inputRight = 0
inputUp = 0
inputDown = 0
inputAction = 0
inputSpecial1 = 0
inputSpecial2 = 0
inputSpecial3 = 0

inputLeftPressed = 0
inputRightPressed = 0
inputUpPressed= 0
inputDownPressed = 0
inputActionPressed = 0
inputSpecial1Pressed = 0
inputSpecial2Pressed = 0
inputSpecial3Pressed = 0
