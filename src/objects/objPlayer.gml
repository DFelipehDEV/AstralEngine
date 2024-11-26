#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Main variables

DeactivateExceptionsAdd(id);

event_inherited();

// State
state = PlayerStateNormal;
stateTimer = 0;
attackPossible = false;

// Jump
jumpStrength = -6.5;
jumpAirTimer = 0;

// Skid
skidDeceleration = 0.3;

// Slide
slideDeceleration = 0.11;
slideResetTimer = 35; // Time to go back to normal state when the player is not holding the slide key

// Spindash
spindashStrength = 0;
spindashStrengthMax = 10;

// Roll
rollDeceleration = 0.05; // Passive roll deceleration
rollDecelerationFric = 0.07; // Roll deceleration while holding the opposite direction
rollDecelerationSlopeUp = 0.06; // Roll deceleration while going up a slope
rollDecelerationSlopeDown = 0.25; // Roll deceleration while going down a slope

// Boost
canBoost = true;
boosting = false;
boostStartSpeed = 11.2;
boostAirTimer = 90; // Amount of time the player can boost in the air
boostAura = noone;

// Energy
energy = 87;
energyMax = 87;

// Airdash
canAirdash = true;

// Homing attack
canHome = false;
homingSpeed = 12;
homingMaxDistance = 220;
homingReticle = noone;

// Possible homing targets
homingObjects = ds_list_create();
ds_list_add_many(homingObjects, objEnemy, objSpring, objMonitor, objHandle, objSwingPole);

// Trick timer
trickCombo = 0;

// Horizontal speed (change physics in the player physics script)
xSpeedTop = 0;
xSpeedMax = 0;
xAcceleration = 0;
xDeceleration = 0;
xSlopeFactor = 0.14;
xDecelerationTemp = 0;
xDirection = 1;

// Vertical speed
noGravityTimer = 0; // This keeps the gravity unexistent
yAcceleration = 0.21; // Gravity
yAccelerationCommon = yAcceleration;
yDirection = 1;

// Terrain
terrainLayer = 0;
terrainType = "";
terrainSound[TerFootstep1] = "snd/PlayerFootstepStone";
terrainSound[TerFootstep2] = "snd/PlayerFootstepStone2";
terrainSound[TerLand] = "snd/PlayerLand";
terrainSound[TerSkid] = "snd/PlayerSkidStone";
terrainPlatform = false; // Whether we are in a platform
pushingTerrain = false; // Whether the player is pushing into a wall
footstepPlayed = false;

angle = 0;
angleHolder = 0;
angleCos = 0;
angleSin = 0;
angleMode = 0;
canMove = true;

// Sensors
sensorX = x;
sensorY = y;
sensorCos = dcos(angle);
sensorSin = dsin(angle);

// Interaction
interactDelay = 0; // Delay until we are able to interact with specific objects(dashs, swingpole...)
physicsMode = 0;
invincibility = 0;
invincibilityTimer = 0;
shield = ShieldNoone;
shieldInstance = noone;
combineActive = false;
goal = false;

// Water
waterrunSolid = noone;
underwaterDrownFrame = 0; // Frame index to drown timer
underwaterAirTimer = 600;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input variables

allowKeys = 1;
allowKeysTimer = 0;

keyLeft = 0;
keyRight = 0;
keyUp = 0;
keyDown = 0;
keyAction = 0;
keySpecial1 = 0;
keySpecial2 = 0;
keySpecial3 = 0;

keyLeftPressed = 0;
keyRightPressed = 0;
keyUpPressed= 0;
keyDownPressed = 0;
keyActionPressed = 0;
keySpecial1Pressed = 0;
keySpecial2Pressed = 0;
keySpecial3Pressed = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Misc

cam = instance_create(x, y, objCamera);
cam.target = id;
hud = instance_create(x, y, objPlayerHUD);
hud.ownerID = id;

// Sensors
drawSensors = false;
PlayerSensorPosUpdate();
bottomCollision = false;
edgeCollision = false;

// Voicelines
PlayerSetVoicelines(CharacterSonic);

// Trail
trailx = ds_list_create()
traily = ds_list_create()
trailal = ds_list_create()
trailLength = 19;
trailTimer = 0;
trailColor = make_color_rgb(25,100,255);
trailAlpha = 0;

// Stars
starTimer = 0;

// Sound
grind = 0;

afterimageTimer = 0;

character = CharacterSonic;
characterPhysics = PlayerPhysicsSonic;
boostSprite = sprBoost;

AnimationInit(AnimationIndexSonic);

PlayerSetCharacter(CharacterSonic);
PlayerPhysicModeSet(physicsMode);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);

ds_list_destroy(trailx);
ds_list_destroy(traily);
ds_list_destroy(trailal);

instance_destroy_id(shieldInstance);
instance_destroy_id(cam);
instance_destroy_id(boostAura);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create dust effect

DummyEffectCreate(x, y, sprDust, 0.3, 0, -1, bm_normal, 1, 1, 1, image_angle);
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Lose rings

global.playerRings -= 1;

alarm[1] = 60;
if (global.playerRings == 0) {
    alarm[1] = -1;
    if (character == CharacterSuperSonic) {
        PlayerSetCharacter(CharacterSonic);
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Death handle

if (state != PlayerStateDead) {
    // Die at bottom of room
    if (y >= room_height) {
        PlayerSetState(PlayerStateDead);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

PlayerAngleLocals();

if (canMove) {
    x += (angleCos * xSpeed) * global.timeScale;
    y -= (angleSin * xSpeed) * global.timeScale;

    repFactor = 1;

    if (abs(xSpeed) > 11) {
        repFactor = round(abs(xSpeed)/9)
    }

    if (xSpeed > 0) {
        while (PlayerCollisionRight(x, y, angle, maskMid)) {
            x -= angleCos;
            y += angleSin;
        }
    }

    if (xSpeed < 0) {
        while (PlayerCollisionLeft(x, y, angle, maskMid)) {
            x += angleCos;
            y -= angleSin;
        }
    }

    // Cache collision
    PlayerCollisionCache();

    if (ground) {
        repeat (repFactor) {
            if (PlayerCollisionMain(x, y) && edgeCollision) {
                do {
                    x -= angleSin;
                    y -= angleCos;
                }until(!PlayerCollisionMain(x, y))
            }

            if (PlayerCollisionSlope(x, y, angle, maskMid) && !PlayerCollisionMain(x, y)) {
                do {
                    x += angleSin;
                    y += angleCos;
                }until(PlayerCollisionMain(x, y))
            }
        }

        PlayerCollisionCache();

        // Crushing
        if (bottomCollision && PlayerCollisionTop(x, y, angle, maskBig)) {
            // Kill player
            PlayerSetState(PlayerStateDead);
            exit;
        }

        // Water running
        if (PlayerCollisionObjectBottom(x, y, 0, maskBig, objWaterHorizon) && angle == 0 && abs(xSpeed) > 10) {
            // Check if there is no watersolid
            if (waterrunSolid == noone) {
                waterrunSolid = instance_create(x, bbox_bottom, objWaterSolid);
            }
            else {
                // Stick solid to our position
                waterrunSolid.x = x;
            }
        }
        else {
            // Destroy water solid
            if (waterrunSolid != noone) {
                instance_destroy_id(waterrunSolid);

                waterrunSolid = noone;
            }
        }

        // Fall if there is not enough speed.
        if (angle >= 75 && angle <= 285 && abs(xSpeed) < 4) {
            if (state != PlayerStateGrind) {
                PlayerFlight();
            }
        }

        PlayerCollisionCache();

        // Fall off the ground if the edges aren't colliding
        if (angle != 0 && !edgeCollision) {
            PlayerFlight();               
        } 
        
        // Get new angle
        if (edgeCollision && ground) {
            // Store the new angle
            angleHolder = PlayerGetAngle(x, y, angle);
    
            // Smooth angle
            if (abs(angle - angleHolder) < 45) {
                PlayerSetAngle(angle + (angleHolder-angle)*0.5);
            }
            else {
                PlayerSetAngle(angleHolder);
            }
        }
        else {
            PlayerSetAngle(0);
        }
    
        // Leave the ground
        if (!bottomCollision) {
            ground = false;
            PlayerSetAngle(0);
        }                            
    }                   
    
    // Vertical movement        
    if (!ground) {                   
        y += ySpeed * global.timeScale;
        
        // Cache collision
        PlayerCollisionCache();
        
        // Crushing
        if (bottomCollision && PlayerCollisionTop(x, y, angle, maskBig)) {
            // Kill player
            PlayerSetState(PlayerStateDead);
            exit;                        
        }
        
        // Ceiling
        if (ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskBig)) {
            if (PlayerCollisionLeftEdge(x, y, 180) && PlayerCollisionRightEdge(x, y, 180)) {
                PlayerSetAngle(PlayerGetAngle(x, y, 180))
                                        
                if (angle < 140 || angle > 220) {
                    xSpeed = -angleSin * (ySpeed*1.5);
                    ySpeed = 0;     
                    ground = true;  
                    PlayerCollisionCache();             
                }
                // Reset angle
                else {
                    PlayerSetAngle(0);
                }
            }
        }
                
        // Move the player outside in case he has got stuck into the floor or the ceiling           
        while (ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskMid)) {
            y += 1;
        }            
        while (ySpeed > 0 && PlayerCollisionBottom(x, y, 0, maskMid)) {
            y -= 1;
        }            
    
        // Wall collision (needs to be performed because y axis has recently changed)
        while (PlayerCollisionRight(x, y, angle, maskMid)) {
            x -= angleCos;
            y += angleSin;
        }
        
        while (PlayerCollisionLeft(x, y, angle, maskMid)) {
            x += angleCos;
            y -= angleSin;
        }
        
        // Add gravity
        if (noGravityTimer == 0 && state != PlayerStateCorkscrew && state != PlayerStateAirdash
        && state != PlayerStateWaylauncher) {
            ySpeed = min(ySpeed + yAcceleration * global.timeScale, 15);
        }
    
        PlayerCollisionCache();
        // Land
        if (ySpeed >= 0 && bottomCollision) {
            if (edgeCollision) {
                PlayerSetAngle(PlayerGetAngle(x, y, angle));
                PlayerCollisionCache();
            }
    
            xSpeed -= angleSin * ySpeed;
            
            // Play landing sound effect
            if (abs(ySpeed) > 2) {
                PlayerTerrainSndUpdate();
                PlaySound(terrainSound[TerLand]);
            }
            
            ySpeed = 0;
            ground = true;
            boostAirTimer = 90;
        }
    
        // Check if we're on the air but we collided with the ceiling
        if (ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskBig)) {
            ySpeed = 0;
        }
    }

    // Horizontal movement
    // Limit speed
    if (abs(xSpeed) > xSpeedMax) {
        xSpeed -= (xDeceleration * 1.2) * sign(xSpeed);
    }

    if (state != PlayerStateRoll) {
        // Acceleration and deceleration on slopes
        if (ground && angle > 35 && angle < 325) {
            if (angle > 40 && angle < 320) {
                xSpeed -= angleSin * xSlopeFactor;
            }
        }
    }

    // Stop when meet a wall/slide pass and isnt sliding
    if ((xSpeed > 0 && (PlayerCollisionRight(x, y, angle, maskBig))) || (xSpeed > 0 && PlayerCollisionObjectRight(x, y, angle, maskBig, objSlidepassSensor) && state != PlayerStateSlide && state != PlayerStateRoll)) {
        xSpeed = 0;
        pushingTerrain = true;
        if (ground && state != PlayerStatePush && floorto(angle, 22.5) == 0) {
            xDirection = 1;
            PlayerSetState(PlayerStatePush);
        }
    }
    else if ((xSpeed < 0 && (PlayerCollisionLeft(x, y, angle, maskBig))) || (xSpeed < 0 && PlayerCollisionObjectLeft(x, y, angle, maskBig, objSlidepassSensor) && state != PlayerStateSlide && state != PlayerStateRoll)) {
        xSpeed = 0;
        pushingTerrain = true;
        if (ground && state != PlayerStatePush && floorto(angle, 22.5) == 0) {
            xDirection = -1;
            PlayerSetState(PlayerStatePush);
        }
    }
    else {
        pushingTerrain = false;
    }

    // Decrease gravity freeze timer
    if (noGravityTimer > 0) {
        noGravityTimer -= 1;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Homing reticle

if (canHome) {
    var i, _currentObjectNear, _index;

    for (i = 0; i < ds_list_size(homingObjects); i += 1) {
        _index = ds_list_find_value(homingObjects, i);

        if (instance_exists(_index)) {
            _currentObjectNear = instance_nearest(x, y, _index);

            if (!instance_exists(homingReticle)
            && distance_to_object(_currentObjectNear) <= homingMaxDistance
            && (sign(_currentObjectNear.x - x) == xDirection || sign(_currentObjectNear.x - x) == 0)
            && y < _currentObjectNear.y + 9
            && !collision_line(x, y, _currentObjectNear.x, _currentObjectNear.y, objTerrain, 1, 1)) {

                // Create reticle at the nearest target
                homingReticle = instance_create(_currentObjectNear.x, _currentObjectNear.y, objPlayerReticle);
                homingReticle.target = _currentObjectNear;
                homingReticle.ownerID = id;
                break;
            }
        }
    }

    if (instance_exists(homingReticle)) {
        if (instance_exists(homingReticle.target)) {
            if (distance_to_object(homingReticle.target) > homingMaxDistance
            || sign(homingReticle.target.x - x) != xDirection
            || y >= homingReticle.target.y + 9
            || collision_line(x, y, homingReticle.target.x, homingReticle.target.y, objTerrain, 1, 1)) {
                // Destroy reticle if the target is no longer valid and not in the homing attack state
                if (state != PlayerStateHomingAttack) {
                    instance_destroy_id(homingReticle);
                    homingReticle = noone;
                }
            }
        } else if (state != PlayerStateHomingAttack) {
            // Destroy the reticle if the target no longer exists
            instance_destroy_id(homingReticle);
            homingReticle = noone;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Actions

canHome = false;
// Stop boosting
if (!keySpecial1 || energy <= 0 || abs(xSpeed) < 2.2 || state == PlayerStateRoll || animation == "FLING" || (boostAirTimer == 0 && !ground)) && boosting {
    boosting = false;
    canBoost = false;
    PlayerPhysicModeSet(physicsMode);
}

if (boosting) {
    if (!ground) {
        if (state != PlayerStateCorkscrew) {
            boostAirTimer -= 1;
        }
    }
}

// Perform state script
script_execute(state);
stateTimer += global.timeScale;

attackPossible = boosting ||
    invincibility == InvincibilityMonitor ||
    state == PlayerStateJump ||
    state == PlayerStateRoll ||
    state == PlayerStateAirdash ||
    state == PlayerStateHomingAttack ||
    state == PlayerStateStomp ||
    state == PlayerStateSlide ||
    state == PlayerStateLightspeed
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Object handle
// Handle collisions with objects

if (state != PlayerStateDead) {
    interactDelay = max(interactDelay - 1, 0)

    PlayerHandleLayers();
    PlayerHandleRings();
    PlayerHandleEnemy();
    PlayerHandleProjectile();
    PlayerHandleCheckpoint();
    PlayerHandleSpikes();
    PlayerHandleHurt();
    if (interactDelay == 0){ PlayerHandleSprings(); PlayerHandleDash(); }
    PlayerHandleRails();
    PlayerHandleWayLauncher();
    PlayerHandleWater();
    PlayerHandleGimmicks();
    PlayerHandleCrane();
    PlayerHandleWallJump();
    PlayerHandleBox();
    PlayerHandleDestructive();
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Keys

allowKeysTimer = max(allowKeysTimer - 1, 0);
if (allowKeys) {
    var _thisInput;
    _thisInput = input.inputDevice[0];

    keyLeft = _thisInput & (1 << InputLeft);
    keyRight = _thisInput & (1 << InputRight);
    keyUp = _thisInput & (1 << InputUp);;
    keyDown = _thisInput & (1 << InputDown);
    keyAction = _thisInput & (1 << InputAction);
    keySpecial1 = _thisInput & (1 << InputSpecial1);
    keySpecial2 = _thisInput & (1 << InputSpecial2);
    keySpecial3 = _thisInput & (1 << InputSpecial3);

    keyLeftPressed = _thisInput & (1 << InputLeftPressed);
    keyRightPressed = _thisInput & (1 << InputRightPressed);
    keyUpPressed = _thisInput & (1 << InputUpPressed);
    keyDownPressed = _thisInput & (1 << InputDownPressed);
    keyActionPressed = _thisInput & (1 << InputActionPressed);
    keySpecial1Pressed = _thisInput & (1 << InputSpecial1Pressed);
    keySpecial2Pressed = _thisInput & (1 << InputSpecial2Pressed);
    keySpecial3Pressed = _thisInput & (1 << InputSpecial3Pressed);

    if (allowKeysTimer > 0) {
        keyLeft = 0;
        keyRight = 0;
        keyUp = 0;
        keyDown = 0;
        keyAction = 0;
        keySpecial1 = 0;
        keySpecial2 = 0;
        keySpecial3 = 0;

        keyLeftPressed = 0;
        keyRightPressed = 0;
        keyUpPressed= 0;
        keyDownPressed = 0;
        keyActionPressed = 0;
        keySpecial1Pressed = 0;
        keySpecial2Pressed = 0;
        keySpecial3Pressed = 0;
    }

    // Disable keys
    if (keyLeft && keyRight) {
        keyLeft = false;
        keyRight = false;
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Underwater

// Check if the player is underwater
if (physicsMode == PhysicsWater && state != PlayerStateDead) {
    underwaterAirTimer -= 1;

    // Spawn some bubbles
    if (underwaterAirTimer mod 100 == 60) {
        instance_create(x, y, objWaterBubbleSmall);
    }

    // Check if the player is starting to drown
    if (underwaterAirTimer < 120) {
        // Animate visual drown counter
        underwaterDrownFrame += 0.009;

        if (global.roomTick mod 30 == 1) {
            // Play sound effect until you drown
            PlaySoundSingle("snd/PlayerLossingAir", global.soundVolume, 1);
        }

        // Check if we have drowned
        if (underwaterDrownFrame >= 5.9 && !sound_isplaying("snd/PlayerDrown")) {
            global.playerRings = 0;
            PlayerSetState(PlayerStateDead);

            sound_stop("snd/PlayerLossingAir");
            PlaySound("snd/PlayerDrown");
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stay in screen

if (x < cam.leftBorder + 12) {
    xSpeed = 0;
    x = cam.leftBorder + 12;
}

if (x > cam.rightBorder - 12) {
    xSpeed = 0;
    x = cam.rightBorder - 12;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation system and rotation
// Handle animations and rotation

// Animation system
AnimationSystem(animationList);

// Rotate Sprites
if (xSpeed == 0 && ground
|| state == PlayerStateRoll) {
    image_angle = 0;
}
else {
    if (ground) {
        // Rotate while moving on the ground
        image_angle = approach_angle(image_angle, angle, 3 + abs(xSpeed))
    }
    // Rotate until reaches to the normal angle
    else {
        image_angle = approach_angle(image_angle, 0, 4);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effects(Footsteps, Trail, Afterimage, Stars)

// Footsteps
switch (animation) {
    case "WALK":
    case "WALK_2":
    case "JOG":
    case "JOG_2":
    case "RUN":
        if(floor(image_index) == 3 || floor(image_index) == 7) {
            if (!footstepPlayed) {
                PlayerTerrainSndUpdate();
                // Create water splash if the player is running in the water
                if (PlayerCollisionObjectBottom(x, y, angle, maskBig, objWaterHorizon)) {
                    DummyEffectCreate(x, y, sprWaterSplash, 0.45, 0, 1, bm_add, 1, xDirection, 1, 0);
                }

                // Create dust effect
                if (terrainType != "WATER" && alarm[0] == -1) {
                    alarm[0] = 1;
                }
                sound_stop(terrainSound[TerFootstep1])
                sound_stop(terrainSound[TerFootstep2])
                PlaySound(choose(terrainSound[TerFootstep1],terrainSound[TerFootstep2]), global.soundVolume, 1, false);
                footstepPlayed = true;
            }
        }
        else {
            footstepPlayed = false;
        }
        break;

    default:
        footstepPlayed = false;
}

trailTimer -= 1;
trailAlpha = lerp(trailAlpha, trailTimer/110, 0.08);
// AfterImage
afterimageTimer = max(afterimageTimer - 1, 0);
if (abs(xSpeed) >= 11 || abs(ySpeed) >= 11) && afterimageTimer == 0 {
    afterimageTimer = 15;
}

if (afterimageTimer > 0) {
    if (round(global.roomTick*global.timeScale) mod 6 == 1) {
        AfterimageEffectCreate(x, y, sprite_index, image_index, 1, xDirection, 1, image_angle, afterimageColor1, afterimageColor2);
    }
}

// Trail
TrailUpdate(
floor(x)+dcos(angle+90)+angleCos*xSpeed,
floor(y)-dsin(angle+90)+ySpeed-angleSin*xSpeed,
trailAlpha > 0.1
)

starTimer = max(starTimer - 1, 0);
// Stars
if (starTimer > 0 && starTimer mod 5 == 1) {
    DummyEffectCreate(x + irandom_range(-25, 25), y + irandom_range(-25, 25), sprStar, 0.25, 0, choose(1, -2), bm_normal, 1, 1, 1, 0);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Invincibility

// Decrease invincibility time
if (invincibility != InvincibilityHurt) {
    if (invincibilityTimer > 0) {
        invincibilityTimer -= 1;
    }
    // End invincibility
    else {
        if (invincibility == InvincibilityMonitor) {
            if (instance_exists(objMusicManager)) {
                with (objMusicManager) {
                    sound_stop("bgm/Invincibility");
                    playTempMusic = "";
                }
            }
            FadeMusic(false);
        }
        invincibility = InvincibilityNoone;
    }
}
else {
    if (state != PlayerStateHurt) {
        invincibility = InvincibilityNoone;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Attraction

var _nearRing;
_nearRing = instance_nearest(x, y, objRing);
_distance = distance_to_object(_nearRing);

if ((_distance < 32 && boosting) || (_distance < 65 && shield == ShieldElectricity)) {
    with (_nearRing) {
        instance_destroy();
        with (instance_create(x, y, objRingMagnetic)) {
            ownerID = objPlayer;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera

if (cam.target == id) {
    var _targetSpeed;
    _targetSpeed = (((x - xprevious)/global.timeScale) * 12);
    if (state != PlayerStateWaylauncher)
        cam.xShift = approach(cam.xShift, round(_targetSpeed/2)*2, 7);

    switch(state) {
        case PlayerStateLookup:
            cam.yShift = approach(cam.yShift, -90, 3);
            break;

        case PlayerStateCrouch:
            cam.yShift = approach(cam.yShift, 90, 3);
            break;

        case PlayerStateWaylauncher:
            if (keyLeft) {
                cam.xShift = approach(cam.xShift, -80, 10);
            }
            else if (keyRight) {
                cam.xShift = approach(cam.xShift, 80, 10);
            }
            else {
                cam.xShift = approach(cam.xShift, 0, 10);
            }

            if (keyUp) {
                cam.yShift = approach(cam.yShift, -80, 10);
            }
            else if (keyDown) {
                cam.yShift = approach(cam.yShift, 80, 10);
            }
            else {
                cam.yShift = approach(cam.yShift, 0, 10);
            }
            break;

        case PlayerStateStomp:
            cam.yShift = approach(cam.yShift, 210, 3);
            break;

        default:
            if (cam.yShakeTimer == 0) {
                _targetSpeed = ((y - yprevious)/global.timeScale) * 5
                cam.yShift = approach(cam.yShift, round(_targetSpeed/2)*2, 6);
            }
    }
}
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Goal ring

if (goal) {
    xSpeed = 0;
    ySpeed = 0;
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw character

if (trailAlpha > 0.1) {
    draw_set_blend_mode(bm_add)
    draw_set_color(trailColor)
    draw_set_alpha(trailAlpha)
    DrawTrail(sprPlayerTrail, 20, 1);
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_set_blend_mode(bm_normal)
}

// Draw grind effect
if (state == PlayerStateGrind) {
    draw_sprite_ext(sprPlayerGrind, global.gameTime div 30, floor(x), floor(y), xDirection, yDirection, image_angle, c_white, image_alpha);
}

// Draw character if the player is not hurt. Blink when hurt
if (invincibility != InvincibilityBlink || (invincibility == InvincibilityBlink && (invincibilityTimer div 1.5) mod 3 == 1)) {
    if (character == CharacterSuperSonic) {
        shader_pixel_set(global.shaderColorSwap);
        texture_set_stage("Palette", sprite_get_texture(sprSonicPalette, ((global.roomTick/10) << 0) mod 2))
        shader_pixel_uniform_f("u_texHeight", sprite_get_height(sprSonicPalette) + 1)
    }

    draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), xDirection, yDirection, image_angle, image_blend, image_alpha);
    shader_reset();
}

if (state == PlayerStateSpindash) {
    // Spindash normal dust
    if (animation == "SPINDASH") {
        draw_sprite_ext(sprPlayerSpindashLow, global.gameTime div 40, floor(x), floor(y), xDirection , yDirection, image_angle, c_white, image_alpha);
    }

    // Spindash charging dust
    if (animation == "SPINDASH_CHARGE") {
        draw_sprite_ext(sprPlayerSpindashHigh, global.gameTime div 40, floor(x), floor(y), xDirection , yDirection, image_angle, c_white, image_alpha);
    }
}

// Check if the player is underwater
if (physicsMode == PhysicsWater) {
    // Check if the player is drowning
    if (underwaterAirTimer < 120 && state != PlayerStateDead) {
        // If drowning, show time till you drown
        draw_sprite(sprDrownTimer, floor(underwaterDrownFrame), floor(x) + 16, floor(y) - 12);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// DEBUG SENSORS

if (drawSensors) {
    // Draw main masks
    draw_sprite_ext(maskHitbox, 0, floor(x), floor(y), image_xscale, image_yscale, 0, c_white, 0.8);
    draw_sprite_ext(maskMain, 0, floor(x), floor(y), image_xscale, image_yscale, 0, c_white, 0.8);

    // Draw sensor masks
    draw_sprite_ext(maskBig, 0, floor(x + angleSin * sensorBottomDistance), floor(y + angleCos * sensorBottomDistance), image_xscale, image_yscale, 0, c_white, 0.8);
    draw_sprite_ext(maskMid, 0, floor(x + angleSin * 22), floor(y + angleCos * 22), image_xscale, image_yscale, 0, c_white, 0.8);
    draw_sprite_ext(maskBig, 0, floor(x - angleSin * sensorTopDistance), floor(y - angleCos * sensorTopDistance), image_xscale, image_yscale, 0, c_white, 0.8);
    draw_sprite_ext(maskBig, 0, floor(x - angleCos * sensorLeftDistance), floor(y + angleSin * sensorLeftDistance), image_xscale, image_yscale, 0, c_white, 0.8);
    draw_sprite_ext(maskBig, 0, floor(x + angleCos * sensorRightDistance), floor(y - angleSin * sensorRightDistance), image_xscale, image_yscale, 0, c_white, 0.8);

    draw_line(floor(x - sensorCos * 8 + sensorSin * 8), floor(y + sensorSin * 8 + sensorCos * 8), floor(x - sensorCos * 8 + sensorSin * 36), floor(y + sensorSin * 8 + sensorCos * 36))
    draw_line(floor(x + sensorCos * 8 + sensorSin * 8), floor(y - sensorSin * 8 + sensorCos * 8), floor(x + sensorCos * 8 + sensorSin * 36), floor(y - sensorSin * 8 + sensorCos * 36))
}
