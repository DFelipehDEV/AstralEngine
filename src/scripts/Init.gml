/// Init()
// Initialize the game

// Load all sounds and musics
sound_add_directory_ext("Resources/snd", ".wav", 0, false, "snd/")
sound_add_directory_ext("Resources/bgm", ".ogg", 1, true, "bgm/");

// Fonts
global.fontHUD = font_add_sprite(sprFontHUD, ord("0"), false, -2);
global.fontText = font_add_sprite(sprFontText, ord(","), true, 0);
global.fontResults = font_add_sprite(sprFontResults, ord("0"), false, -1);

// Screen
global.screenSize = 1;
global.screenVSync = true;

global.gamepad = joystick_count();

// Volume
global.volumeSounds = 1;
global.volumeMusic = 1;
global.volumeVoice = 1;
global.volumeAmbient = 1;

// Music
global.bgmSound = -1;

// Player
global.player[0] = noone; // Player instance
global.playerRings = 0;
global.playerCheckTime = 0;
global.playerCheckX = 0;
global.playerCheckY = 0;

// Rank requirements
global.stageRank[RankC] = 2500;
global.stageRank[RankB] = 4000;
global.stageRank[RankA] = 6000;
global.stageRank[RankS] = 8500;

// Game state
global.debug = false;
global.deltaMultiplier = 1; // Time movement multiplier, lower values make objects move slower, higher values make objects move faster, used for slow motion
global.gameState = GameStateRunning;

global.shaderHeat = shdHeat();
global.shaderColorSwap = shdColorSwap();

// Create essential controllers
if (!instance_exists(objControllerInput))
    instance_create(0, 0, objControllerInput);
if (!instance_exists(objControllerMusic))
    instance_create(0, 0, objControllerMusic);
if (!instance_exists(objControllerRoom))
    instance_create(0, 0, objControllerRoom);
