#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables

DeactivateExceptionsAdd(id);
constParallaxTileDirection = 0;
constParallaxBackground = 1;

constParallaxXFactor= 2;
constParallaxXSpeed = 3;
constParallaxXScroll= 4;
constParallaxXOffset= 5;
constParallaxXSeparation = 6;

constParallaxYFactor= 7;
constParallaxYSpeed = 8;
constParallaxYScroll= 9;
constParallaxYOffset= 10;
constParallaxYSeparation = 11;

constParallaxLeft = 12;
constParallaxTop = 13;
constParallaxWidth = 14;
constParallaxHeight = 15;

nodeNumParallax = 0;
nodeParallax = -1;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy

DeactivateExceptionsRemove(id);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle parallax

var nodeCurrent, xSpeed, xScroll, ySpeed, yScroll;

// Handle parallax
for (nodeCurrent = 0; nodeCurrent < nodeNumParallax; nodeCurrent += 1) {
    // Retrieve values
    xSpeed = ds_grid_get(nodeParallax, constParallaxXSpeed, nodeCurrent);
    xScroll = ds_grid_get(nodeParallax, constParallaxXScroll, nodeCurrent);
    ySpeed = ds_grid_get(nodeParallax, constParallaxYSpeed, nodeCurrent);
    yScroll = ds_grid_get(nodeParallax, constParallaxYScroll, nodeCurrent);

    // Add speed values to scroll
    ds_grid_set(nodeParallax, constParallaxXScroll, nodeCurrent, xScroll+xSpeed);
    ds_grid_set(nodeParallax, constParallaxYScroll, nodeCurrent, yScroll+ySpeed);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw background

// Draw background
var nodeCurrent, tileDir, backg, xFactor, xSpeed, xScroll, xOffset, xSeparation;
var yFactor, ySpeed, yScroll, yOffset, ySeparation, Left, Top, Width, Height, xFinal, yFinal;

// Temporary variables for parallax properties
var tempXFactor, tempXOffset, tempXScroll;
var tempYFactor, tempYOffset, tempYScroll;

// Retrieve view properties outside of loop
var viewX, viewY;
viewX = view_xview[view_current];
viewY = view_yview[view_current];

var frame;
frame = image_index * global.deltaMultiplier;
for (nodeCurrent = 0; nodeCurrent < nodeNumParallax; nodeCurrent += 1) {
    // Retrieve values and store them in temporary variables
    tileDir = ds_grid_get(nodeParallax, constParallaxTileDirection, nodeCurrent);
    backg= ds_grid_get(nodeParallax, constParallaxBackground,    nodeCurrent);

    tempXFactor = ds_grid_get(nodeParallax, constParallaxXFactor,       nodeCurrent);
    tempXOffset = ds_grid_get(nodeParallax, constParallaxXOffset,       nodeCurrent);
    tempXScroll = ds_grid_get(nodeParallax, constParallaxXScroll,       nodeCurrent);
    xSeparation = ds_grid_get(nodeParallax, constParallaxXSeparation,   nodeCurrent);

    tempYFactor = ds_grid_get(nodeParallax, constParallaxYFactor,       nodeCurrent);
    tempYOffset = ds_grid_get(nodeParallax, constParallaxYOffset,       nodeCurrent);
    tempYScroll = ds_grid_get(nodeParallax, constParallaxYScroll,       nodeCurrent);
    ySeparation = ds_grid_get(nodeParallax, constParallaxYSeparation,   nodeCurrent);

    Left= ds_grid_get(nodeParallax, constParallaxLeft,          nodeCurrent);
    Top = ds_grid_get(nodeParallax, constParallaxTop,           nodeCurrent);
    Width = ds_grid_get(nodeParallax, constParallaxWidth,         nodeCurrent);
    Height = ds_grid_get(nodeParallax, constParallaxHeight,        nodeCurrent);

    // Calculate final position
    xFinal = floor(viewX * tempXFactor + tempXOffset + tempXScroll);
    yFinal = floor(viewY * tempYFactor + tempYOffset + tempYScroll);

    // Draw
    switch(tileDir) {
        case ParallaxSpritePart:
            draw_sprite_part(backg, frame, Left, Top, Width, Height, xFinal, yFinal);
            break;

        case ParallaxSpriteHorizontal:
            DrawSpriteTiledHorizontalPart(backg, frame, Left, Top, Width, Height, xFinal, yFinal, xSeparation);
            break;

        case ParallaxSpriteVertical:
            DrawSpriteTiledVerticalPart(backg, frame, Left, Top, Width, Height, xFinal, yFinal, ySeparation);
            break;

        case ParallaxSpriteTiled:
            DrawSpriteTiledPart(backg, Left, Top, Width, Height, xFinal, yFinal, xSeparation, ySeparation);
            break;

        case ParallaxSprite:
            draw_sprite(backg, frame, xFinal, yFinal);
            break;

        case ParallaxBGHorizontal:
            DrawBackgroundRepeatHorizontal(backg, xFinal, yFinal, 1, 1, xSeparation, Width);
            break;

        case ParallaxBGVertical:
            DrawBackgroundRepeatVertical(backg, xFinal, yFinal, 1, 1, ySeparation, Height);
            break;

        case ParallaxBG:
            draw_background(backg, xFinal, yFinal);
            break;
    }
}
