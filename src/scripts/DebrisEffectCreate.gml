/// DebrisEffectCreate(x, y, depth, sprite, frame, animSpeed, xscale, yscale, rotate, hspeed, vspeed, gravity)
with (instance_create_depth(argument0, argument1, argument2, objDebris)) {
    sprite_index = argument3;
    image_index = argument4;
    image_speed = argument5 * global.timeScale;
    image_xscale = argument6;
    image_yscale = argument7;
    rotate = argument8;

    hspeed = argument9 * global.timeScale;
    vspeed = argument10 * global.timeScale;
    gravity = argument11 * global.timeScale;
}
