#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
event_inherited();

path = noone;
spd = 2;
acceleration = 0.08;

currentPoint = 0;
targetPoint = 1;
currentSpeed = 0;
dist = 0;
segmentLength = 0;

startX = x;
startY = y;
targetX = x;
targetY = y;

tileset = -1;
left = 0;
top = 0;
gridX = 0;
gridY = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Move
if (path != noone && segmentLength > 0) {
    var _stoppingDist;
    _stoppingDist = (currentSpeed * currentSpeed) / (2 * acceleration);

    if (segmentLength - dist <= _stoppingDist) {
        currentSpeed = max(0.2, currentSpeed - acceleration * global.timeScale);
    } else {
        currentSpeed = min(spd, currentSpeed + acceleration * global.timeScale);
    }

    dist += currentSpeed * global.timeScale;

    if (dist >= segmentLength) {
        x = targetX;
        y = targetY;
        dist = 0;
        currentSpeed = 0;
        currentPoint = targetPoint;
        targetPoint = (targetPoint + 1) mod path_get_number(path);

        startX = path_get_point_x(path, currentPoint);
        startY = path_get_point_y(path, currentPoint);
        targetX = path_get_point_x(path, targetPoint);
        targetY = path_get_point_y(path, targetPoint);

        while (startX == targetX && startY == targetY) {
            targetPoint = (targetPoint + 1) mod path_get_number(path);
            targetX = path_get_point_x(path, targetPoint);
            targetY = path_get_point_y(path, targetPoint);
        }

        segmentLength = point_distance(startX, startY, targetX, targetY);
    } else {
        x = lerp(startX, targetX, dist / segmentLength);
        y = lerp(startY, targetY, dist / segmentLength);
    }
}

// Move player riding the platform
var _body;
_body = instance_place(x, y - 5, objBody);
if (_body != noone) {
    if (_body.ground) {
        _body.x += x - xprevious;
        _body.y = bbox_top - 11;
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field path: path
//field spd: number
//field acceleration: number
//field tileset: background
//field left: number
//field top: number
//field gridX: number
//field gridY: number

/*preview
if (!FieldDefined("tileset")) {
    draw_self();
} else {
    if (!(FieldDefined("left") && FieldDefined("top") && FieldDefined("gridX") && FieldDefined("gridY"))) exit;
    draw_background_part(Background(Field("tileset")), Field("left"), Field("top"), Field("gridX"), Field("gridY"), x, y);
}
*/

if (path != noone && path_get_number(path) > 1) {
    currentPoint = 0;
    targetPoint = 1;
    startX = path_get_point_x(path, currentPoint);
    startY = path_get_point_y(path, currentPoint);
    targetX = path_get_point_x(path, targetPoint);
    targetY = path_get_point_y(path, targetPoint);

    while (startX == targetX && startY == targetY) {
        targetPoint = (targetPoint + 1) mod path_get_number(path);
        targetX = path_get_point_x(path, targetPoint);
        targetY = path_get_point_y(path, targetPoint);
    }

    segmentLength = point_distance(startX, startY, targetX, targetY);
    dist = 0;
    currentSpeed = 0;
    x = startX;
    y = startY;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw
if (tileset == -1) {
    draw_self();
} else {
    draw_background_part(tileset, left, top, gridX, gridY, x, y);
}
