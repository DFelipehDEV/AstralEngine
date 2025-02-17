/// InputInit()
sysinput_init();
joystick_set_deadzone(0.9);

sysinput_add_key("accept", vk_enter);

sysinput_add_key("left", vk_left);
sysinput_add_axes("left", 0, true);
sysinput_add_key("right", vk_right);
sysinput_add_axes("right", 0, false);

sysinput_add_key("up", vk_up);
sysinput_add_axes("up", 1, true);

sysinput_add_key("down", vk_down);
sysinput_add_axes("down", 1, false);

sysinput_add_key("p_jump", ord('A'));
sysinput_add_button("p_jump", 0);

sysinput_add_key("p_boost", ord('S'));
sysinput_add_button("p_boost", 2);

sysinput_add_key("p_lightspeed", ord('F'));
sysinput_add_button("p_lightspeed", 3);

sysinput_add_key("qte_1", ord('A'));
//sysinput_add_button("qte_1", 0);
sysinput_add_key("qte_2", ord('S'));
//sysinput_add_button("qte_2", 1);
sysinput_add_key("qte_3", ord('D'));
//sysinput_add_button("qte_3", 2);
