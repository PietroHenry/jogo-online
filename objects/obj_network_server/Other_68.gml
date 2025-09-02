var _id = async_load[? "id"];
var _type = async_load[? "type"];

if (server == _id) {
    switch (_type) {
        case network_type_connect:
			var _sock = async_load[? "socket"];
			var _inst = instance_create_depth(0, 0, 0, obj_player);
			_inst.sock = _sock;
			ds_map_add(ds_clients, _sock, _inst);
		break;
            
        case network_type_disconnect:
			var _sock = async_load[? "socket"];
			if (ds_map_exists(ds_clients, _sock)) {
			    var _obj = ds_clients[? _sock];
			    if (instance_exists(_obj)) {
			        instance_destroy(_obj);
			    }
			    ds_map_delete(ds_clients, _sock);
			}
		break;
    }
} else {
    var _sock = _id;
    var _obj = ds_clients[? _sock];
    var _buffer = async_load[? "buffer"];
    var _cmd = buffer_read(_buffer, buffer_string);
    
    if (_cmd == "atualizar_player") {
        _obj.x = buffer_read(_buffer, buffer_s16);
        _obj.y = buffer_read(_buffer, buffer_s16);
        _obj.sprite_index = buffer_read(_buffer, buffer_s16);
        _obj.image_index = buffer_read(_buffer, buffer_s16);
        _obj.image_xscale = buffer_read(_buffer, buffer_s8);
    }
}