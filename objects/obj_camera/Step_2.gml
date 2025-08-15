camera_set_view_size(view_camera[view_cam],global.view_width,global.view_height);

if (instance_exists(view_target))
{
	camera_set_view_target(view_camera[view_cam],obj_player);
	var _x1 = view_target.x - global.view_width / 2;
	var _y1 = view_target.y - global.view_height / 2;
	
	_x1 = clamp(_x1,0,room_width  - global.view_width );
	_y1 = clamp(_y1,0,room_height - global.view_height);
	
	var _c_x = camera_get_view_x(view_camera[view_cam]);
	var _c_y = camera_get_view_y(view_camera[view_cam]);
	
	camera_set_view_pos(view_camera[view_cam],lerp(_c_x,_x1,view_spd),lerp(_c_y,_y1,view_spd));
}