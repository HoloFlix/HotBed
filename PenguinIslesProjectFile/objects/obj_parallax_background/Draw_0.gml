var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _p = 1;

draw_sprite(bg_sky, 0, _camx*_p, _camy*_p);

//bg = background file. 0 is sprite layer