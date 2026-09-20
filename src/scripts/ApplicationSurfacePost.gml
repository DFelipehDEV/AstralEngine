/// ApplicationSurfacePost()
d3d_set_alphablend(false);
texture_set_interpolation(false);
d3d_set_projection_ortho(0, 0, global.ww, global.wh, 0);

if (window_get_fullscreen()) {
    draw_clear(window_get_color());
}

draw_surface_stretched(application_surface, global.woffset, global.hoffset, global.rw, global.rh);

draw_reset();
d3d_set_alphablend(true);
