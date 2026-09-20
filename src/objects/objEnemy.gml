#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
event_inherited();
canMove = true;

knockOnDeath = false; // Whether the enemy gets knocked away when defeated

maxHP = 0;
hp = maxHP;

hit = false;
invincibilityTimer = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activation region
instance_activate_region(bbox_left - 4, bbox_top - 4, (bbox_right - bbox_left) + 8, (bbox_bottom - bbox_top) + 8, 1);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Invincibility
invincibilityTimer = max(invincibilityTimer - global.timeScale, 0);
hit = false;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field maxHP : number
//field knockOnDeath : bool
//field canMove : bool

hp = maxHP;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// HP bar
if (hp > 0 && maxHP > 0) {
    var _width, _height, _yOffset, _x1, _x2;
    _width = maxHP * 6;
    _height = 6;
    _yOffset = -5;
    _x1 = x - _width / 2;
    _x2 = x + _width / 2;
    draw_healthbar(_x1, bbox_top + _yOffset, _x2, bbox_top + _yOffset + _height, (hp / maxHP) * 100, c_black, c_red, c_lime, 0, true, true);
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// On Hit
var _dmg;
_dmg = 1;
if (attacker.boosting) _dmg = 2;

hp -= _dmg;
hit = true;
invincibilityTimer = 17;

with (attacker) {
    with (PlayerGetOwnedCamera()) CameraShakeY(17);
    PlayerAddEnergy(8);
    PlayerResetHomingAttack();

    CreateDummy(x, y, sprHit, 0.45, 0, depth - 1, bm_add, 1, 1, 1, 0);
    PlaySound(choose(sndEnemyHit, sndEnemyHit2, sndEnemyHit3));
}

// Death
if (hp <= 0) {
    if (knockOnDeath) {
        var _d;
        _d = instance_create(x, y, objEnemyDeath);
        _d.sprite_index = sprite_index;
        _d.image_xscale = image_xscale;
        _d.image_yscale = image_yscale;
        _d.hspeed = ((attacker.x - attacker.xprevious) * 1.05) * global.timeScale;
        if (attacker.ground) {
            _d.vspeed = -6 * global.timeScale;
        } else {
            _d.vspeed = ((attacker.y - attacker.yprevious) * 0.7) * global.timeScale;
        }
        _d.gravity = 0.2 * sqr(global.timeScale);
        _d.alarm[0] = round(40 / global.timeScale);
    } else {
        CreateDummy(x, y, sprExplosion, 0.35, 0, -0.1, bm_normal, 1, 1, 1, 0);
        PlaySoundSingle(choose(sndExplosion, sndExplosion2));
        repeat(6) {
            var _m;
            _m = instance_create(x, y, objEnemyMetal);
            _m.hspeed = random_range(-3, 3);
            _m.vspeed = random_range(-5, -3);
        }
    }
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw enemy and HP
draw_self();

// HP bar
event_user(0);
