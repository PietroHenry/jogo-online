var _col = function(_colisivel)
{
	if place_meeting(x+hspd,y,_colisivel)
	{
		while !place_meeting(x+sign(hspd),y,_colisivel)
		{x+=sign(hspd)}
		hspd = 0;
		
	}

	if place_meeting(x,y+vspd,_colisivel)
	{
		while !place_meeting(x,y+sign(vspd),_colisivel)
		{y+=sign(vspd)}
		vspd = 0;
	}
	
	if place_meeting(x+hspd,y+vspd,_colisivel)
	{
		while !place_meeting(x+sign(hspd),y+sign(vspd),_colisivel)
		{
			x+=sign(hspd)
			y+=sign(vspd)
		}
		hspd = 0;
		vspd = 0;
	}
}

vspd += grav;

_col(obj_wall)

hspd = clamp(hspd,-hspd_max,hspd_max);
vspd = clamp(vspd,-vspd_max,vspd_max);

x+=hspd;
y+=vspd;

if x <= sprite_width / 2 || x >= room_width - (sprite_width / 2)
{
	hspd = 0;
	x = clamp(x,sprite_width / 2,room_width - (sprite_width / 2));
}