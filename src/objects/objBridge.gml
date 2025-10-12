#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
logsAmount = image_xscale; // Number of logs wich the bridge has
logWidth = sprite_get_width(sprite_index);
width = logsAmount*logWidth;
widthHalf = width / 2;      // Half the width of the bridge (GASP)
maxTension = 8;                   // Max tension (height) possible
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Log management
// Set all logs heights to 0
for (i=0; i<logsAmount; i+=1) heights[i] = 0;

// Find out the logs height depending on the player objects
var _player;
_player = collision_rectangle(x, y - 8, x + width, y + maxTension, objPlayer, true, false);

if (_player) {
    if (_player.onPlatform) {
        var _playerX;
        _playerX = round(_player.x / logWidth) * logWidth;

        var leftGrad, rightGrad, left, right;
        leftGrad = 0;
        rightGrad = 0;

        // Find tension point and calculate gradients safely
        tensionPoint = min(max(floor((_player.x - x) / logWidth), 0), logsAmount - 1);

        if (tensionPoint > 0) {
            leftGrad = (pi * 0.5) / tensionPoint;
        }
        if ((logsAmount - tensionPoint) > 0) {
            rightGrad = (pi * 0.5) / (logsAmount - tensionPoint);
        }

        left  = 0;
        right = pi;

        // Calculate distance from center
        distanceFromCenter = maxTension * (1 - (abs((_player.x - x - widthHalf) / widthHalf)));

        // Reposition all bridge logs
        for (j=0; j <= tensionPoint; j+=1) {
            heightsCurrent = sin(left) * distanceFromCenter;
            if (heights[j] < heightsCurrent) heights[j] = heightsCurrent;
            left += leftGrad;
        }
        for (j=logsAmount - 1; j > tensionPoint; j-=1) {
            heightsCurrent = sin(right) * distanceFromCenter;
            if (heights[j] < heightsCurrent) heights[j] = heightsCurrent;
            right -= rightGrad;
        }
    }
}

// Now, change bridge's height smoothly
for (i=0; i<logsAmount; i+=1) {
    if (instance_exists(logs[i])) {
        logs[i].y = lerp(logs[i].y, y + heights[i], 0.2);
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field sprite_index: sprite
//field maxTension: number
/*preview nodrawself
    if (!FieldDefined("sprite_index")) exit;

    sprite = Sprite(Field("sprite_index"), 0);
    // Create logs
    for (i=0; i < image_xscale; i+=1) {
        draw_sprite(sprite, 0, x + i*sprite_get_width(sprite), y)
    }
*/

logWidth = sprite_get_width(sprite_index);
logsAmount = image_xscale;
width = logsAmount*logWidth;
widthHalf = width / 2;

// Create logs
for (i=0; i < logsAmount; i+=1) {
    heights[i] = 0;
    logs[i] = instance_create(x + i*logWidth, y, objBridgeLog);
    logs[i].sprite_index = sprite_index;
}

event_step();
