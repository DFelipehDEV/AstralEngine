#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables
image_speed = 0.1;

active = false;
speedval = 4.131999

maxTimeScore = 8000;
ringScoreMultiplier = 35;

minimumScoreC = 2500;
minimumScoreB = 4000;
minimumScoreA = 6000;
minimumScoreS = 8500;

player = noone;
rings = 0;
nextRoom = room_next(room);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create results
TransitionFadeRoom(-1, c_white, 0.05, 0.5);
audio_sfx_stop();
PlaySound(sndGoalRingFinish);
instance_create(x, y, objRainbow);

alarm[1] = 30;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Results
var _rings;
_rings = rings;
if (instance_exists(player)) {
    _rings = player.rings;
} else if (instance_exists(objPlayer)) {
    _rings = objPlayer.rings;
}

with (instance_create(0, 0, objResults)) {
    nextRoom = other.nextRoom;
    time = World.gameTime;
    rings = _rings;
    maxTimeScore = other.maxTimeScore;
    ringScoreMultiplier = other.ringScoreMultiplier;
    scoreValueTime = max(0, maxTimeScore-floor(World.gameTime/50000)*4500);
    scoreValueRing = max(0, rings*ringScoreMultiplier);
    minimumScore[RankC] = other.minimumScoreC;
    minimumScore[RankB] = other.minimumScoreB;
    minimumScore[RankA] = other.minimumScoreA;
    minimumScore[RankS] = other.minimumScoreS;
}
instance_destroy();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Goal ring
if (active) {
    if (alarm[0] == -1) {
        speedval -= 0.032
        image_speed = speedval

        if (instance_exists(player)) {
            player.keyRight = true;
            rings = player.rings;
        }
        if (image_speed < 0) {
            image_speed = 0
            alarm[0] = 80
        }
    }
    if (image_speed <= 0) {
        image_index = approach(image_index, 0, 0.1);
    }
}
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activate
if (!active) {
    PlaySound(sndGoalRingSpin);
    active = true;

    player = other.id;
    rings = player.rings;
    with (player) {
        allowKeys = false;
        keyRight = true;
        goal = true;
        StatesSet(PlayerStateNormal);
    }

    if (player.cam != noone) {
        player.cam.target = id;
        player.cam.xShift = 0;
        player.cam.yShift = 0;
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fields
//field maxTimeScore: number
//field ringScoreMultiplier: number
//field minimumScoreC : number
//field minimumScoreB : number
//field minimumScoreA : number
//field minimumScoreS : number
//field nextRoom: room
