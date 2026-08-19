#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
MarkAsActive();
parent = noone;
childCount = 0;
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

    var i, _inst;
    for (i = 0; i < childCount; i += 1) {
        _inst = child[i];
        if (!instance_exists(_inst)) {
            instance_activate_object(_inst);
            if (!instance_exists(_inst)) continue;
        }

        if (parent.image_angle != 0) {
            _inst.x = parent.x + lengthdir_x(offsetDist[i], offsetAngle[i] + parent.image_angle);
            _inst.y = parent.y + lengthdir_y(offsetDist[i], offsetAngle[i] + parent.image_angle);
        } else {
            _inst.x = parent.x + offsetX[i];
            _inst.y = parent.y + offsetY[i];
        }
        _inst.xprevious = _inst.x;
        _inst.yprevious = _inst.y;
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
//field child7 : instance
//field child8 : instance
//field child9 : instance
//field child10 : instance
//field child11 : instance
//field child12 : instance
//field child13 : instance
//field child14 : instance
//field child15 : instance
//field child16 : instance
//field child17 : instance
//field child18 : instance
//field child19 : instance
//field child20 : instance
//field child21 : instance
//field child22 : instance
//field child23 : instance
//field child24 : instance
//field child25 : instance
//field child26 : instance
//field child27 : instance
//field child28 : instance
//field child29 : instance
//field child30 : instance
//field child31 : instance

childCount = 0;

if (instance_exists(parent)) {
    var i, _var, _inst;
    for (i = 0; i < 32; i += 1) {
        _var = "child" + string(i);
        if (variable_local_exists(_var)) {
            _inst = variable_local_get(_var);
            if (instance_exists(_inst)) {
                child[childCount] = _inst;
                offsetX[childCount] = _inst.x - parent.x;
                offsetY[childCount] = _inst.y - parent.y;
                offsetDist[childCount] = point_distance(parent.x, parent.y, _inst.x, _inst.y);
                offsetAngle[childCount] = point_direction(parent.x, parent.y, _inst.x, _inst.y) - parent.image_angle;
                childCount += 1;
            }
        }
    }
}
