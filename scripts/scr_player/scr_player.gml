function player_idle()
{
	sprite_index = sprites.idle
	var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var _left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	
	hspd = approach(hspd,0,dcc);
	
	var _move = _right - _left != 0;
	
	if _move
	{state = player_walk;}
}

function player_walk()
{
	sprite_index = sprites.walk
	
	var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var _left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	
	var _move = _right - _left;
	
	if _move = 0
	{state = player_idle;}else
	{
		image_xscale = sign(_move);
		hspd = approach(hspd,hspd_max * _move,acc);
	}
}