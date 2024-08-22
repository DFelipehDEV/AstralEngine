/// DrawCircularBar(x,y,radius,thickness,maxsegments,segments,startangle,totalangle,direction,colour)
// Code by r2d2upgrade (https://web.archive.org/web/20170815113256/http://ludumdare.com/compo/2015/04/16/circular-and-ring-health-bars-with-gamemaker-code-and-explanation/)

anglechange = (argument7/argument4)*(pi/180)
i = argument6*(pi/180)

ax = argument0+(cos(i)*argument2)
ay = argument1-(sin(i)*argument2)

bx = argument0+(cos(i)*(argument2+argument3))
by = argument1-(sin(i)*(argument2+argument3))

repeat(argument5) {
    i += argument8 * anglechange

    cx = argument0+(cos(i)*argument2)
    cy = argument1-(sin(i)*argument2)

    dx = argument0+(cos(i)*(argument2+argument3))
    dy = argument1-(sin(i)*(argument2+argument3))

    draw_triangle_color(ax,ay,bx,by,dx,dy,argument9,argument9,argument9,0)
    draw_triangle_color(ax,ay,cx,cy,dx,dy,argument9,argument9,argument9,0)

    ax = cx
    ay = cy

    bx = dx
    by = dy
}



// DrawCircularBar(x, y, value, max, colour, radius, transparency, width)

/*if (argument2 > 0) { //no point even running if there is nothing to display (also stops /0
    var i, len, tx, ty, val, numberofsections, sizeofsection;

    numberofsections = 60 //there is no draw_get_circle_precision() else I would use that here
    sizeofsection = 360/numberofsections

    val = (argument2/argument3) * numberofsections

    if (val > 1) { //HTML5 version doesnt like triangle with only 2 sides

        piesurface = surface_create(argument5*2,argument5*2)

        draw_set_color(argument4);
        draw_set_alpha(argument6);

        surface_set_target(piesurface)

        draw_clear_alpha(c_blue,0.7)
        draw_clear_alpha(c_black,0)

        draw_primitive_begin(pr_trianglefan);
        draw_vertex(argument5, argument5);

        for(i=0; i<=val; i += 1) {
            len = (i*sizeofsection)+90; //the 90 here is the starting angle
            tx = lengthdir_x(argument5, len);
            ty = lengthdir_y(argument5, len);
            draw_vertex(argument5+tx, argument5+ty);
        }

        draw_primitive_end();

        draw_set_alpha(1);

        draw_set_blend_mode(bm_subtract)
        draw_set_color(c_black)
        draw_circle(argument5-1, argument5-1,argument5-argument7,false)
        draw_set_color(c_white)
        draw_set_blend_mode(bm_normal)

        surface_reset_target()

        draw_surface(piesurface,argument0-argument5, argument1-argument5)

        surface_free(piesurface)

    }

}*/
