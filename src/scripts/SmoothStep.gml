/// SmoothStep(a, b, t)
var a, b, t;
a = argument0;
b = argument1;
t = argument2;
return lerp(a, b, t*t*(3-2*t));
