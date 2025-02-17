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

ownerID = noone;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create results

instance_create(0, 0, objFadeGoal)
audio_global_stop();
PlaySound(sndGoalRingFinish);
instance_create(x, y, objRainbow)

alarm[1] = 30;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Results

with (instance_create(0, 0, objEventResults)) {
    maxTimeScore = other.maxTimeScore;
    ringScoreMultiplier = other.ringScoreMultiplier;
    scoreValueTime = max(0, maxTimeScore-floor(global.gameTime/50000)*4500);
    scoreValueRing = max(0, global.playerRings*ringScoreMultiplier);
    minimumScore[RankC] = other.minimumScoreC;
    minimumScore[RankB] = other.minimumScoreB;
    minimumScore[RankA] = other.minimumScoreA;
    minimumScore[RankS] = other.minimumScoreS;
}
global.gameTimeAllow = false;

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

        ownerID.keyRight = true;
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

    ownerID = other.id;
    with (ownerID) {
        allowKeys = false;
        keyRight = true;
        PlayerSetState(PlayerStateNormal);
        goal = true;
    }

    ownerID.cam.target = id;
    ownerID.cam.xShift = 0;
    ownerID.cam.yShift = 0;
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
