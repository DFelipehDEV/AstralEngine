/// DrawSpriteTiledVerticalPart(sprite, frame, left, top, width, height, x, y, ySeperation);

var spriteStart, spriteEnd, spriteCurrent, spriteStep, view;
view = view_current;

// Retrieve sprite properties
spriteStep = argument5 + argument8; //sprite_get_height(argument0);
spriteStart = view_yview[view]+((argument7-view_yview[view]) mod spriteStep)-spriteStep;
spriteEnd= view_yview[view]+view_hview[view]+spriteStep;

repeat((spriteEnd - spriteStart)/spriteStep) {
    draw_sprite_part(argument0, argument1, argument2, argument3, argument4, argument5, argument6, spriteStart);
    spriteStart += spriteStep;
}
