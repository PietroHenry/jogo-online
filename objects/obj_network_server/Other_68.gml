var _id = async_load[? "id"];
var _type = async_load[? "type"];

if server == _id
{
	switch(_type)
	{
		case network_type_connect:
			show_message("connect")
			var _sock = async_load[? "socket"]
			var _inst = instance_create_depth(x,y,0,obj_player);
			_inst.sock = _sock;
			ds_map_add(ds_clients, _sock, _inst);
		break;
		
		case network_type_disconnect:
			show_message("disconnect")
			var __sock = async_load[? "socket"]
			var _obj = ds_clients[? __sock];
			instance_destroy(_obj);
			ds_map_delete(ds_clients, __sock);
		break;
	}
}else{
	var _sock = async_load[? "id"];
	var _obj = ds_clients[? _sock]
	var _buff = async_load[? "buffer"];
	var _rbuff = buffer_read(_buff,buffer_string)
	
	if (_rbuff == "atualizar_player")
	{
		var _xx = buffer_read(_buff, buffer_s32);
		var _yy = buffer_read(_buff, buffer_s32);
		var _spr_index = buffer_read(_buff,buffer_s32);
		var _ima_index = buffer_read(_buff,buffer_s32);
		var _ima_xscale = buffer_read(_buff,buffer_s32);
		
		_obj.x				 = _xx;
		_obj.y				 = _yy;
		_obj.sprite_index	 = _spr_index;
		_obj.image_index	 = _ima_index;
		_obj.image_xscale	 = _ima_xscale;
	}
}