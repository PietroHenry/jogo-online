var _escolha = function()
{
	switch(index)
	{
		case 0:
			room_goto(rm_network_server);
		break;
		case 1:
			room_goto(rm_network_client);
		break;
	}
}

draw_set_font(ft_menu);
var _gui_width  = display_get_gui_width ();
var _gui_height = display_get_gui_height();
var _x1 = _gui_width  / 2;
var _y1 = _gui_height / 4;
var _margin = 200;
var _m_x = device_mouse_x_to_gui(0);
var _m_y = device_mouse_y_to_gui(0);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var _i = 0; _i < op_max; _i++)
{
	var _y2 = _y1 + (_margin * _i);
	var _string_w = string_width (options[_i]);
	var _string_h = string_height(options[_i]);
	
	if (point_in_rectangle(_m_x,_m_y,_x1 - _string_w / 2,_y2 - _string_h / 2,_x1 + _string_w / 2,_y2 + _string_h / 2))
	{
		draw_set_color(c_red)
		index = _i;
		if (mouse_check_button_pressed(mb_left))
		{_escolha()}
	}else{draw_set_color(c_white)}
	
	draw_text(_x1,_y2,options[_i]);
}

draw_set_color(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);