/// ParallaxAddNode(TileDirection, Background, XFactor, XSpeed, XScroll, XOffset, XSeparation, YFactor, YSpeed, YScroll, YOffset, YSeparation, Left, Top, Width, Height)

// Create or resize grid if needed
if (nodeParallax == -1) nodeParallax = ds_grid_create(16, 1);
else                     ds_grid_resize(nodeParallax, 16, nodeNumParallax+1);

ds_grid_set(nodeParallax,  0, nodeNumParallax, argument0);
ds_grid_set(nodeParallax,  1, nodeNumParallax, argument1);
ds_grid_set(nodeParallax,  2, nodeNumParallax, argument2);
ds_grid_set(nodeParallax,  3, nodeNumParallax, argument3);
ds_grid_set(nodeParallax,  4, nodeNumParallax, argument4);
ds_grid_set(nodeParallax,  5, nodeNumParallax, argument5);
ds_grid_set(nodeParallax,  6, nodeNumParallax, argument6);
ds_grid_set(nodeParallax,  7, nodeNumParallax, argument7);
ds_grid_set(nodeParallax,  8, nodeNumParallax, argument8);
ds_grid_set(nodeParallax,  9, nodeNumParallax, argument9);
ds_grid_set(nodeParallax, 10, nodeNumParallax, argument10);
ds_grid_set(nodeParallax, 11, nodeNumParallax, argument11);
ds_grid_set(nodeParallax, 12, nodeNumParallax, argument12);
ds_grid_set(nodeParallax, 13, nodeNumParallax, argument13);
ds_grid_set(nodeParallax, 14, nodeNumParallax, argument14);
ds_grid_set(nodeParallax, 15, nodeNumParallax, argument15);

nodeNumParallax += 1;
