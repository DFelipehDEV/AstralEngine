#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

event_inherited();
enemyBust = false;    // Flag that checks whether the enemy will be thrown after defeated or not

enemyHP = noone;   // Current HP of the enemy (no HP if set to noone)
enemyHPMax = enemyHP; // Maximum HP of the enemy

enemyBlinkTimer = 0;       // Timer for enemy "invincibility" after losing HP

hit = false;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activation region

instance_activate_region(bbox_left - 4, bbox_top - 4, (bbox_left - bbox_right) + 8, (bbox_top - bbox_bottom) + 8, 1);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw enemy and HP

// If the enemy is blinking or not, draw it
if (enemyBlinkTimer > 0 && (global.gameTime div 60) mod 3 || enemyBlinkTimer == 0) {
    // Draw enemy
    draw_self();
}

// Draw HP bar
if (enemyHP != noone) {
    draw_healthbar(x, bbox_bottom, x + enemyHPMax * 6, bbox_bottom + 6, (enemyHP / enemyHPMax) * 100, c_dkgray, c_red, c_lime, 0, true, true);
}
