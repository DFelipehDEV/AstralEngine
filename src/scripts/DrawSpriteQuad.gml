/// DrawSpriteQuad(x1, y1, x2, y2, x3, y3, x4, y4, spr, sub, sc, rot, blend, alpha) {
var x1, y1, x2, y2, x3, y3, x4, y4, spr, sub, sc, rot, blend, alpha;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
x3 = argument4;
y3 = argument5;
x4 = argument6;
y4 = argument7;
spr = argument8;
sub = argument9;
sc = argument10;
rot = argument11;
blend = argument12;
alpha = argument13;
var sizx, sizy, tex, xxt2, xxt3, xxt4, yyt2, yyt3, yyt4, z, msin, mcos;

rot = degtorad(rot);
msin = sin(rot);
mcos = cos(rot);
sizx = sprite_get_width(spr) * sc;
sizy = sprite_get_height(spr) * sc;
tex = sprite_get_texture(spr, sub);

texture_set_repeat(true);
draw_primitive_begin_texture(pr_trianglestrip, tex);
xxt2 = (x2 - x1) / sizx;
yyt2 = (y2 - y1) / sizy;

xxt3 = (x3 - x1) / sizx;
yyt3 = (y3 - y1) / sizy;

xxt4 = (x4 - x1) / sizx;
yyt4 = (y4 - y1) / sizy;

z = xxt2;
xxt2 = xxt2 * mcos + yyt2 * msin;
yyt2 = yyt2 * mcos + z * msin;

z = xxt3;
xxt3 = xxt3 * mcos + yyt3 * msin;
yyt3 = yyt3 * mcos + z * msin;

z = xxt4;
xxt4 = xxt4 * mcos + yyt4 * msin;
yyt4 = yyt4 * mcos + z * msin;

draw_vertex_texture_color(x1, y1, 0, 0, blend, alpha);
draw_vertex_texture_color(x2, y2, xxt2, yyt2, blend, alpha);
draw_vertex_texture_color(x3, y3, xxt3, yyt3, blend, alpha);
draw_vertex_texture_color(x4, y4, xxt4, yyt4, blend, alpha);
draw_primitive_end();
