/// CreateDummy(x, y, sprite, animation speed, repeat times, depth, blend mode, alpha, xscale, yscale, angle)
with (instance_create(argument0, argument1, objDummy)) {
    depth = argument5;
    sprite_index = argument2;
    image_speed = argument3 * global.timeScale;
    image_alpha = argument7;
    image_xscale = argument8;
    image_yscale = argument9;
    image_angle = argument10;

    repeatTimes = argument4;
    blendMode = argument6;
}
