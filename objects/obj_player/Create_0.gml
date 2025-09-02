event_inherited();
sock = noone;
randomize();
x = random_range(100, room_width - 100);
mask_index = spr_player_pink_Idle;

jump_force = 7;
move_spd_max = 6;

enum PLAYER
{
	PINK,
	OWLET,
	DUDE
}

index = choose(PLAYER.PINK,PLAYER.OWLET,PLAYER.DUDE);

if instance_number(obj_player) - 1 > 0
{
	if (obj_player.index = index)
	{index = choose(PLAYER.PINK,PLAYER.OWLET,PLAYER.DUDE);}
}

sprites = 
{
	idle : noone,
	walk : noone,
	up : noone,
	hurt : noone,
	fall : noone,
	death : noone,
	attack : noone
}

switch(index)
{
	case PLAYER.PINK:
		sprites = 
		{
			idle :		spr_player_pink_Idle,
			walk :		spr_player_pink_Run,
			up :		spr_player_pink_up,
			hurt :		spr_player_pink_Hurt,
			fall :		spr_player_pink_fall,
			death :		spr_player_pink_Death,
			attack :	spr_player_pink_Attack
		}
	break;
	case PLAYER.OWLET:
		sprites = 
		{
			idle :		spr_player_owlet_Idle,
			walk :		spr_player_owlet_Run,
			up :		spr_player_owlet_up,
			hurt :		spr_player_owlet_Hurt,
			fall :		spr_player_owlet_fall,
			death :		spr_player_owlet_Death,
			attack :	spr_player_owlet_Attack
		}
	break;
	case PLAYER.DUDE:
		sprites = 
		{
			idle :		spr_player_dude_Idle,
			walk :		spr_player_dude_Run,
			up :		spr_player_dude_up,
			hurt :		spr_player_dude_Hurt,
			fall :		spr_player_dude_fall,
			death :		spr_player_dude_Death,
			attack :	spr_player_dude_Attack
		}
	break;
}

state = player_idle;