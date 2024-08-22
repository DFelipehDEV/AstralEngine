/// DrawSpriteTiledPart(sprite, left, top, width, height, x, y, x sep, y sep);

var spriteXStart, spriteXEnd, spriteXCurrent, spriteXStep,
spriteYStart, spriteYEnd, spriteYCurrent, spriteYStep, view;
view = view_current;

// Retrieve background properties
spriteXStep = argument3+argument7;
spriteXStart = view_xview[view]+((argument5-view_xview[view]) mod spriteXStep)-spriteXStep;
spriteXEnd= view_xview[view]+view_wview[view]+spriteXStep;
spriteYStep = argument4+argument8;
spriteYStart = view_yview[view]+((argument6-view_yview[view]) mod spriteYStep)-spriteYStep;
spriteYEnd= view_yview[view]+view_hview[view]+spriteYStep;

for (spriteYCurrent = spriteYStart; spriteYCurrent <= spriteYEnd; spriteYCurrent += spriteYStep)
    for (spriteXCurrent = spriteXStart; spriteXCurrent <= spriteXEnd; spriteXCurrent += spriteXStep)
        draw_sprite_part(argument0, image_index, argument1, argument2, argument3, argument4, spriteXCurrent, spriteYCurrent);
