function sprite_chao(_grund,_fall)
{
	if place_meeting(x,y+1,obj_wall)
	{return _grund}else{return _fall}
}

function player_idle()
{
	sprite_index = sprite_chao(sprites.idle,sprites.fall);
	var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var _left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	
	var _jump = keyboard_check(ord("W")) || keyboard_check(vk_space);
	var _gruond = place_meeting(x,y+1,obj_wall);
	
	move_spd = approach(move_spd,0,dcc);
	hspd = lengthdir_x(move_spd,move_dir);
	
	var _move = _right - _left != 0;
	
	if _move
	{state = player_walk;}
	
	if _jump && _gruond
	{vspd = -jump_force;}
}

function player_walk()
{
	sprite_index = sprite_chao(sprites.walk,sprites.fall);
	
	var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var _left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	
	var _jump = keyboard_check(ord("W")) || keyboard_check(vk_space);
	var _gruond = place_meeting(x,y+1,obj_wall);
	
	var _move = _right - _left;
	
	if _move = 0
	{state = player_idle}else{
		image_xscale = sign(_move);
		move_dir = point_direction(0,0,_right - _left,0);
		move_spd = approach(move_spd,move_spd_max,acc);
	}
	
	hspd = lengthdir_x(move_spd,move_dir);
	
	if _jump && _gruond
	{vspd = -jump_force;}
}