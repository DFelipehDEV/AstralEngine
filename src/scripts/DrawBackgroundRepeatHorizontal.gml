/// DrawBackgroundRepeatHorizontal(bg, x, y, xscale, yscale, xSeperation, width)

var bgWidth, spriteStep, spriteStart, spriteEnd, view;
view = view_current;
bgWidth = argument6;
spriteStep = argument5 + bgWidth;
spriteStart = view_xview[view] + ((argument1 - view_xview[view]) mod spriteStep) - bgWidth;
spriteEnd = view_xview[view] + view_wview[view] + bgWidth;
var i;
for (i = spriteStart; i < spriteEnd; i += spriteStep) {
    draw_background_ext(argument0, i, argument2, argument3, argument4, 0, c_white, 1);
}
