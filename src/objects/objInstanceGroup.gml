#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
parent = noone;
child[0] = noone;
child[1] = noone;
child[2] = noone;
child[3] = noone;
child[4] = noone;
child[5] = noone;
child[6] = noone;

childCount = 7;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Follow parent
if (instance_exists(parent)) {
    x = parent.x;
    y = parent.y;

    var _dx, _dy;
    _dx = parent.x - parent.xprevious;
    _dy = parent.y - parent.yprevious;

    if (_dx != 0 || _dy != 0) {
        var i;
        for (i = 0; i < childCount; i += 1) {
            instance_activate_object(child[i]);
            if (!instance_exists(child[i])) continue;
            child[i].x += _dx;
            child[i].y += _dy;
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field parent : instance
//field child0 : instance
//field child1 : instance
//field child2 : instance
//field child3 : instance
//field child4 : instance
//field child5 : instance
//field child6 : instance
var i;
for (i = 0; i < 6; i += 1) {
    var _var;
    _var = "child" + string(i);
    if (variable_local_exists(_var))
        child[i] = variable_local_get(_var);
}
