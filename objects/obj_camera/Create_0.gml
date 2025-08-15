resolution_width = 1280;
resolution_height = 720;
resolution_scale = 2;
global.view_width  = resolution_width  / resolution_scale;
global.view_height = resolution_height / resolution_scale;
view_target = obj_player;
view_cam = 0;
view_spd = 0.1;
camera_set_view_target(view_camera[view_cam],obj_player);
window_set_size(global.view_width * resolution_scale, global.view_height * resolution_scale);
surface_resize(application_surface, global.view_width * resolution_scale, global.view_height * resolution_scale);
display_set_gui_size(global.view_width,global.view_height);

var _timer_center = time_source_create(time_source_game, 1, time_source_units_frames, window_center);
time_source_start(_timer_center);