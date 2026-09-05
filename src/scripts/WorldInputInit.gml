/// WorldInputInit()
keyInputIcons = dss_map_create();
buttonInputIcons = dss_map_create();
buttonSprite = sprPlaystationButtons;
sysinput_init();
//joystick_set_deadzone(0.1);

sysinput_add_key("pause", vk_enter);
sysinput_add_button("pause", gp_start);

sysinput_add_key("accept", vk_enter);
sysinput_add_key("accept", ord('A'));
sysinput_add_button("accept", gp_face1);
InputIconAddKey("accept", 0);
InputIconAddButton("accept", gp_face1);

sysinput_add_key("cancel", ord('S'));
sysinput_add_button("cancel", gp_face2);
InputIconAddKey("cancel", 18);
InputIconAddButton("cancel", gp_face2);

sysinput_add_key("left", vk_left);
sysinput_add_axes("left", gp_axislh, true);

sysinput_add_key("right", vk_right);
sysinput_add_axes("right", gp_axislh, false);

sysinput_add_key("up", vk_up);
sysinput_add_axes("up", gp_axislv, true);

sysinput_add_key("down", vk_down);
sysinput_add_axes("down", gp_axislv, false);

sysinput_add_key("p_jump", ord('A'));
sysinput_add_button("p_jump", gp_face1);
InputIconAddKey("p_jump", 0);
InputIconAddButton("p_jump", gp_face1);

sysinput_add_key("p_stomp", vk_down);
sysinput_add_button("p_stomp", gp_face2);
InputIconAddKey("p_stomp", 3);
InputIconAddButton("p_stomp", gp_face2);

sysinput_add_key("p_slide", vk_down);
sysinput_add_button("p_slide", gp_face2);
InputIconAddKey("p_slide", 29);
InputIconAddButton("p_slide", gp_face2);

sysinput_add_key("p_boost", ord('S'));
sysinput_add_button("p_boost", gp_face3);
InputIconAddKey("p_boost", 18);
InputIconAddButton("p_boost", gp_face3);

sysinput_add_key("p_trick", ord('S'));
sysinput_add_button("p_trick", gp_face3);
InputIconAddKey("p_trick", 18);
InputIconAddButton("p_trick", gp_face3);

sysinput_add_key("p_lightspeed", ord('F'));
sysinput_add_button("p_lightspeed", gp_face4);
InputIconAddKey("p_lightspeed", 5);
InputIconAddButton("p_lightspeed", gp_face4);

sysinput_add_key("p_transform_l", ord('Q'));
sysinput_add_button("p_transform_l", gp_shoulderlb);

sysinput_add_key("p_transform_r", ord('E'));
sysinput_add_button("p_transform_r", gp_shoulderrb);

sysinput_add_key("p_transform", ord('T'));

sysinput_add_key("npc_interact", ord('F'));
sysinput_add_button("npc_interact", gp_face4);
InputIconAddKey("npc_interact", 5);
InputIconAddButton("npc_interact", gp_face4);

sysinput_add_key("dialogue_skip", ord('A'));
sysinput_add_button("dialogue_skip", gp_face1);
InputIconAddKey("dialogue_skip", 0);
InputIconAddButton("dialogue_skip", gp_face1);

sysinput_add_key("qte_0", ord('A'));
sysinput_add_button("qte_0", gp_face1);
InputIconAddKey("qte_0", 0);
InputIconAddButton("qte_0", gp_face1);

sysinput_add_key("qte_1", ord('S'));
sysinput_add_button("qte_1", gp_face3);
InputIconAddKey("qte_1", 18);
InputIconAddButton("qte_1", gp_face3);

sysinput_add_key("qte_2", ord('D'));
sysinput_add_button("qte_2", gp_face2);
InputIconAddKey("qte_2", 3);
InputIconAddButton("qte_2", gp_face2);
