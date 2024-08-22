/// DrawBackgroundRepeatVertical(bg, x, y, xscale, yscale, ySeparation, height)

var bgHeight, spriteStep, spriteStart, spriteEnd, view;
view = view_current;
bgHeight = argument6;
spriteStep = argument5 + bgHeight;
spriteStart = view_yview[view] + ((argument2 - view_yview[view]) mod spriteStep) - bgHeight;
spriteEnd = view_yview[view] + view_hview[view] + bgHeight;
var i;
for (i = spriteStart; i < spriteEnd; i += spriteStep) {
    draw_background_ext(argument0, argument1, i, argument3, argument4, 0, c_white, 1);
}
