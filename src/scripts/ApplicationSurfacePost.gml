/// ApplicationSurfacePost()
d3d_set_alphablend(false);
draw_surface(application_surface, 0, 0);
draw_reset();
d3d_set_alphablend(true);
