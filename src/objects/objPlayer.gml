#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Main variables
event_inherited();
DeactivateExceptionsAdd(id);

// State
StatesInit(PlayerStateNormal);
canAttack = false;

// Jump
jumpStrength = -6.5;
jumpAirTimer = 0;

// Skid
skidDeceleration = 0.3;

// Slide
slideFriction = 0.11;
slideCancelTimer = 35; // Time to go back to normal state when the player is not holding the slide key

// Spindash
spindashStrength = 0;
spindashStrengthMax = 10;

// Roll
rollFriction = 0.05; // Passive friction while rolling
rollBrakeFriction = 0.07; // Friction when holding opposite direction while rolling
rollUphillFriction = 0.06; // Friction when rolling uphill
rollDownhillForce = 0.25; // Acceleration when rolling downhill

// Boost
canBoost = true;
boosting = false;
boostStartSpeed = 11.2;
boostAirTimer = 90; // Amount of time the player can boost in the air
boostAura = noone; // Instance of the boost aura VFX

// Energy
energy = 87;
energyMax = 87;

// Airdash
canAirdash = true;
airdashSpeed = 11;

// Homing attack
canHome = false;
homingSpeed = 12;
homingRange = 220;
homingReticle = noone;
homingObjects = ds_list_create();
ds_list_add_many(homingObjects, objEnemy, objSpring, objMonitor, objHandle, objSwingPole);

// Trick timer
trickCombo = 0;

// Movement Flags
canMove = true;
canMoveX = true;
canMoveY = true;

// Horizontal speed (change physics in the player physics script)
xTopSpeed = 0;
xMaxSpeed = 0;
xAcceleration = 0;
xFriction = 0;
xSlopeFactor = 0.14;
xMinSpeedToFall = 4; // Minimum speed to fall when on a slope
xFrictionTemp = 0;
xDirection = 1;

// Vertical speed
noGravityTimer = 0; // This keeps the gravity from being applied for a certain amount of time
yGravity = 0.21;
yDefaultGravity = yGravity;
yDirection = 1;

// Terrain
terrainLayer = 0;
terrainType = "";
terrainSound[TerFootstep1] = sndFootstepStone;
terrainSound[TerFootstep2] = sndFootstepStone2;
terrainSound[TerLand] = sndLandStone;
terrainSound[TerSkid] = sndSkidStone;
onPlatform = false;
pushingWall = false;

footstepPlayed = false;

angle = 0;
angleHolder = 0;
angleCos = 0;
angleSin = 0;
angleMode = 0;

// Sensors
sensorX = x;
sensorY = y;
sensorCos = dcos(angle);
sensorSin = dsin(angle);

// Interaction
physicsMode = 0;
invincibility = 0;
invincibilityTimer = 0;
shield = ShieldNoone;
shieldInstance = noone;
combineActive = false;
goal = false;

// Water Interaction
waterRunSpeed = 10; // Minimum speed required to run on water
waterRunSolid = noone; // Instance of the solid placed beneath the player when running in the water
underwaterDrownFrame = 0; // Frame index to drown timer
underwaterTime = 0;
underwaterTimeToDrown = 60 * 25;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input variables

allowKeys = true;
lockKeysTimer = 0;

keyLeft = 0;
keyRight = 0;
keyUp = 0;
keyDown = 0;
keyAction = 0;
keyBoost = 0;
keyLightspeed = 0;
keyStomp = 0;

keyLeftPressed = 0;
keyRightPressed = 0;
keyUpPressed= 0;
keyDownPressed = 0;
keyActionPressed = 0;
keyBoostPressed = 0;
keyLightspeedPressed = 0;

inputDirection = 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Misc

cam = instance_create(x, y, objCamera);
cam.target = id;
hud = instance_create(x, y, objPlayerHUD);
hud.player = id;

// Sensors
drawSensors = false;
PlayerResetSensors();
bottomCollision = false;
edgeCollision = false;

// Voicelines
PlayerSetVoicelines(CharacterSonic);

// Trail
trailx = ds_list_create();
traily = ds_list_create();
trailal = ds_list_create();
trailLength = 19;
trailTimer = 0;
trailColor = make_color_rgb(25,100,255);
trailAlpha = 0;

// Stars
starTimer = 0;

// Sound
grindSound = -1;

// Afterimage
afterImageTimer = 0;
afterImageInterval = 15; // Frames between afterimages
afterImageMinSpeed = 11;

character = CharacterSonic;
characterPhysics = PlayerPhysicsSonic;
boostSprite = sprBoost;

AnimationInit(AnimationIndexSonic);

PlayerSetCharacter(CharacterSonic);
PlayerSetPhysicsMode(physicsMode);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy
DeactivateExceptionsRemove(id);

PlayerDispatch();
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create dust effect

CreateDummy(x, y, sprDust, 0.3, 0, -1, bm_normal, 1, 1, 1, image_angle);
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
        StatesSet(PlayerStateDead);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (canMove) {
    if (canMoveX) {
        x += (angleCos * xSpeed) * global.timeScale;
    }
    if (canMoveY) {
        y -= (angleSin * xSpeed) * global.timeScale;
    }

    repFactor = 1;

    if (abs(xSpeed) > 11) {
        repFactor = round(abs(xSpeed) / 9);
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
            if (edgeCollision) {
                while (PlayerCollisionMain(x, y)) {
                    x -= angleSin;
                    y -= angleCos;
                }
            }

            if (PlayerCollisionSlope(x, y, angle, maskMid) && !PlayerCollisionMain(x, y)) {
                while (!PlayerCollisionMain(x, y)) {
                    x += angleSin;
                    y += angleCos;
                }
            }
        }

        PlayerCollisionCache();

        // Crushing
        if (bottomCollision && PlayerCollisionTop(x, y, angle, maskBig)) {
            // Kill player
            StatesSet(PlayerStateDead);
            exit;
        }

        // Water running
        if (PlayerCollisionObjectBottom(x, y, 0, maskBig, objWaterHorizon) && angle == 0 && abs(xSpeed) > waterRunSpeed) {
            // Check if the watersolid doesnt exist
            if (waterRunSolid == noone) {
                waterRunSolid = instance_create(x, bbox_bottom, objWaterSolid);
            }
            else {
                // Stick solid to our position
                waterRunSolid.x = x;
            }
        }
        else {
            // Destroy water solid
            if (waterRunSolid != noone) {
                instance_destroy_id(waterRunSolid);

                waterRunSolid = noone;
            }
        }

        // Fall if there is not enough speed.
        if (angle >= 75 && angle <= 285 && abs(xSpeed) < xMinSpeedToFall) {
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
            angleHolder = PlayerCalculateAngle(x, y, angle);
    
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
            PlayerSetGround(false);
            PlayerSetAngle(0);
        }                            
    }                   
    
    // Vertical movement        
    if (!ground) {
        if (canMoveY) {
            y += ySpeed * global.timeScale;
        }
        
        // Cache collision
        PlayerCollisionCache();
        
        // Crushing
        if (bottomCollision && PlayerCollisionTop(x, y, angle, maskBig)) {
            // Kill player
            StatesSet(PlayerStateDead);
            exit;                        
        }
        
        // Ceiling
        if (ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskBig)) {
            if (PlayerCollisionLeftEdge(x, y, 180) && PlayerCollisionRightEdge(x, y, 180)) {
                PlayerSetAngle(PlayerCalculateAngle(x, y, 180))
                                        
                if (angle < 140 || angle > 220) {
                    xSpeed = -angleSin * (ySpeed*1.5);
                    ySpeed = 0;     
                    PlayerSetGround(true);
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
            ySpeed = min(ySpeed + yGravity * global.timeScale, 15);
        }
    
        PlayerCollisionCache();
        // Land
        if (ySpeed >= 0 && bottomCollision) {
            if (edgeCollision) {
                PlayerSetAngle(PlayerCalculateAngle(x, y, angle));
                PlayerCollisionCache();
            }
    
            xSpeed -= angleSin * ySpeed;
            
            // Play landing sound effect
            if (abs(ySpeed) > 2) {
                PlayerHandleFootstepSensors();
                PlaySound(terrainSound[TerLand]);
            }
            
            ySpeed = 0;
            boostAirTimer = 90;
            PlayerSetGround(true);
        }
    
        // Check if we're on the air but we collided with the ceiling
        if (ySpeed < 0 && PlayerCollisionTop(x, y, 0, maskBig)) {
            ySpeed = 0;
        }
    }

    // Horizontal movement
    // Limit speed
    if (abs(xSpeed) > xMaxSpeed) {
        xSpeed -= (xFriction * 1.2) * sign(xSpeed);
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
        pushingWall = true;
        if (ground && state != PlayerStatePush) {
            xDirection = 1;
            StatesSet(PlayerStatePush);
        }
    }
    else if ((xSpeed < 0 && (PlayerCollisionLeft(x, y, angle, maskBig))) || (xSpeed < 0 && PlayerCollisionObjectLeft(x, y, angle, maskBig, objSlidepassSensor) && state != PlayerStateSlide && state != PlayerStateRoll)) {
        xSpeed = 0;
        pushingWall = true;
        if (ground && state != PlayerStatePush) {
            xDirection = -1;
            StatesSet(PlayerStatePush);
        }
    }
    else {
        pushingWall = false;
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
    var i, _currentObjectNear, _index, _dir;
    _dir = PlayerGetInputDirection();

    for (i = 0; i < ds_list_size(homingObjects); i += 1) {
        _index = ds_list_find_value(homingObjects, i);

        if (instance_exists(_index)) {
            _currentObjectNear = instance_nearest(x, y, _index);

            if (!instance_exists(homingReticle)
            && distance_to_object(_currentObjectNear) <= homingRange
            && (sign(_currentObjectNear.x - x) == _dir || sign(_currentObjectNear.x - x) == 0)
            && y < _currentObjectNear.y + 9
            && !collision_line(x, y, _currentObjectNear.x, _currentObjectNear.y, objTerrain, 1, 1)) {

                // Create reticle at the nearest target
                homingReticle = instance_create(_currentObjectNear.x, _currentObjectNear.y, objPlayerReticle);
                homingReticle.target = _currentObjectNear;
                break;
            }
        }
    }

    if (instance_exists(homingReticle)) {
        if (instance_exists(homingReticle.target)) {
            if (distance_to_object(homingReticle.target) > homingRange
            || sign(homingReticle.target.x - x) != _dir
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
if ((!keyBoost || energy <= 0 || abs(xSpeed) < 2.2 || state == PlayerStateRoll || animation == "FLING" || (boostAirTimer == 0 && !ground)) && boosting) {
    boosting = false;
    canBoost = false;
    PlayerSetPhysicsMode(physicsMode);
}

if (boosting) {
    if (!ground) {
        if (state != PlayerStateCorkscrew) {
            boostAirTimer -= 1;
        }
    }
}

StatesUpdate(global.timeScale);

canAttack = boosting ||
    invincibility == InvincibilityMonitor ||
    state == PlayerStateJump ||
    state == PlayerStateRoll ||
    state == PlayerStateAirdash ||
    state == PlayerStateHomingAttack ||
    state == PlayerStateStomp ||
    state == PlayerStateSlide ||
    state == PlayerStateLightspeed;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Object handle
// Handle collisions with objects

if (state != PlayerStateDead) {
    PlayerHandleLayers();
    PlayerHandleRings();
    PlayerHandleEnemy();
    PlayerHandleProjectile();
    PlayerHandleCheckpoint();
    PlayerHandleSpikes();
    PlayerHandleHurt();
    PlayerHandleSprings();
    PlayerHandleDash();
    PlayerHandleRails();
    PlayerHandleWayLauncher();
    PlayerHandleWater();
    PlayerHandleGimmicks();
    PlayerHandleCrane();
    PlayerHandleWallJump();
    PlayerHandleBox();
    PlayerHandleDestructive();
    PlayerHandleMonitor();
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Keys

lockKeysTimer = max(lockKeysTimer - 1, 0);
if (allowKeys) {
    keyLeft = sysinput_get("left");
    keyRight = sysinput_get("right");
    keyUp = sysinput_get("up");
    keyDown = sysinput_get("down");
    keyAction = sysinput_get("p_jump");
    keyStomp = sysinput_get("p_stomp");
    keyBoost = sysinput_get("p_boost");
    keyLightspeed = sysinput_get("p_lightspeed");

    keyLeftPressed = sysinput_get_pressed("left");
    keyRightPressed = sysinput_get_pressed("right");
    keyUpPressed = sysinput_get_pressed("up");
    keyDownPressed = sysinput_get_pressed("down");
    keyActionPressed = sysinput_get_pressed("p_jump");
    keyBoostPressed = sysinput_get_pressed("p_boost");
    keyLightspeedPressed = sysinput_get_pressed("p_lightspeed");

    inputDirection = sysinput_get_axis("left", "right");
    show_debug_message(inputDirection);

    if (lockKeysTimer > 0) {
        PlayerResetKeys();
    }

    // Disable keys
    if (keyLeft && keyRight) {
        keyLeft = false;
        keyRight = false;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activate

instance_activate_region(bbox_left, bbox_top, 128, 128, true);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Underwater

// Check if the player is underwater
if (physicsMode == PhysicsWater && state != PlayerStateDead) {
    underwaterTime += 1;

    if (underwaterTime mod 120 == 1) {
        instance_create(x, y, objWaterBubbleSmall);
    }

    // Started to drown
    if (underwaterTime >= underwaterTimeToDrown) {
        // It should take 2 seconds to decrease a second in the drown timer
        if (floor(underwaterTime) mod 120 == 1) {
            underwaterDrownFrame += 1;

            PlaySoundSingle(sndPlayerLoseAir, global.soundVolume, 1);
        }

        // Drown
        if (underwaterDrownFrame == 6) {
            physicsMode = PhysicsNormal;
            global.playerRings = 0;
            StatesSet(PlayerStateDead);

            PlaySound(sndPlayerDrown);
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
        image_angle = approach_angle(image_angle, angle, (3 + abs(xSpeed)) * global.timeScale);
    }
    // Rotate until reaches to the normal angle
    else {
        image_angle = approach_angle(image_angle, 0, 4 * global.timeScale);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effects(Footsteps, Trail, Afterimage, Stars)

var _frame;
_frame = floor(image_index);
playFootstep = false;

switch (animation) {
    case "WALK":
    case "WALK_2":
    case "JOG":
    case "JOG_2":
    case "RUN":
        if (_frame == 3 || _frame == 7) playFootstep = true;
        break;

    case "PUSH":
        if (_frame == 1 || _frame == 6) playFootstep = true;
        break;
}

// Footsteps
if (playFootstep) {
    if (!footstepPlayed) {
        PlayerHandleFootstepSensors();
        // Create water splash if the player is running in the water
        if (PlayerCollisionObjectBottom(x, y, angle, maskBig, objWaterHorizon)) {
            CreateDummy(x, y, sprWaterSplash, 0.45, 0, 1, bm_add, 1, xDirection, 1, 0);
        }

        // Create dust effect
        if (terrainType != "WATER" && alarm[0] == -1) {
            alarm[0] = 1;
        }
        audio_stop(terrainSound[TerFootstep1]);
        audio_stop(terrainSound[TerFootstep2]);
        PlaySound(choose(terrainSound[TerFootstep1],terrainSound[TerFootstep2]), global.soundVolume, 1, false);
        footstepPlayed = true;
    }
}
else {
    footstepPlayed = false;
}

trailTimer -= 1;
trailAlpha = lerp(trailAlpha, trailTimer/110, 0.08);
// AfterImage
afterImageTimer = max(afterImageTimer - 1 * global.timeScale, 0);
if ((abs(xSpeed) >= afterImageMinSpeed || abs(ySpeed) >= afterImageMinSpeed) && afterImageTimer == 0) {
    afterImageTimer = afterImageInterval;
}

if (afterImageTimer > 0) {
    if (floor(afterImageTimer) mod 6 == 1) {
        CreateAfterImage(x, y, sprite_index, image_index, 1, xDirection, 1, image_angle, afterimageColor1, afterimageColor2);
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
    CreateDummy(x + irandom_range(-25, 25), y + irandom_range(-25, 25), sprStar, 0.25, 0, choose(1, -2), bm_normal, 1, 1, 1, 0);
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
            audio_music_resume();
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
            target = objPlayer;
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
    var _xSpeed, _ySpeed;
    _xSpeed = (x - xprevious) / global.timeScale;
    _ySpeed = (y - yprevious) / global.timeScale;
    if (state != PlayerStateWaylauncher)
        cam.xShift = approach(cam.xShift, _xSpeed * 11, 5);

    switch(state) {
        case PlayerStateLookup:
            if (stateTimer > 30)
                cam.yShift = approach(cam.yShift, -90, 4);
            break;

        case PlayerStateCrouch:
            if (stateTimer > 30)
                cam.yShift = approach(cam.yShift, 90, 4);
            break;

        case PlayerStateWaylauncher:
            // Define target shifts based on key input
            var targetXShift, targetYShift;
            targetXShift = 0;
            targetYShift = 0;

            if (keyLeft) {
                targetXShift = -80;
            } else if (keyRight) {
                targetXShift = 80;
            } else if (keyUp) {
                targetYShift = -80;
            } else if (keyDown) {
                targetYShift = 80;
            }

            cam.xShift = approach(cam.xShift, targetXShift, 10);
            cam.yShift = approach(cam.yShift, targetYShift, 10);
            break;

        case PlayerStateStomp:
            cam.yShift = approach(cam.yShift, 210, 3);
            break;

        default:
            if (cam.yShakeTimer == 0) {
                cam.yShift = approach(cam.yShift, _ySpeed * 2, 5);
            }
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset globals
PlayerDispatch();
PlayerResetGlobalVariables();
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
    draw_set_blend_mode(bm_add);
    draw_set_color(trailColor);
    draw_set_alpha(trailAlpha);
    DrawTrail(sprPlayerTrail, 20, 1);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_blend_mode(bm_normal);
}

// Draw grind effect
if (state == PlayerStateGrind) {
    draw_sprite_ext(sprPlayerGrind, global.gameTime div 30, floor(x), floor(y), xDirection, yDirection, image_angle, c_white, image_alpha);
}

// Draw character if the player is not hurt. Blink when hurt
if (invincibility != InvincibilityBlink || (invincibility == InvincibilityBlink && (invincibilityTimer div 1.5) mod 3 == 1)) {
    if (character == CharacterSuperSonic) {
        shader_pixel_set(global.shaderColorSwap);
        texture_set_stage("Palette", sprite_get_texture(sprSonicPalette, floor(global.gameTime div 120) mod 2));
        shader_pixel_uniform_f("u_texHeight", sprite_get_height(sprSonicPalette) + 1);
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
    if (underwaterTime >= underwaterTimeToDrown) {
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

    draw_line(floor(x - sensorCos * 8 + sensorSin * 8), floor(y + sensorSin * 8 + sensorCos * 8), floor(x - sensorCos * 8 + sensorSin * 36), floor(y + sensorSin * 8 + sensorCos * 36));
    draw_line(floor(x + sensorCos * 8 + sensorSin * 8), floor(y - sensorSin * 8 + sensorCos * 8), floor(x + sensorCos * 8 + sensorSin * 36), floor(y - sensorSin * 8 + sensorCos * 36));
}
