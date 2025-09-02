var _buffer = async_load[? "buffer"];
var _type = buffer_read(_buffer, buffer_string);

if (_type == "Send_Client") {
    var _num_players = buffer_read(_buffer, buffer_s16);
    
    var _active_players = ds_list_create();
    
    for (var _i = 0; _i < _num_players; _i++) {
        var _sock = buffer_read(_buffer, buffer_s16);
        var _xx = buffer_read(_buffer, buffer_s16);
        var _yy = buffer_read(_buffer, buffer_s16);
        var _spr_index = buffer_read(_buffer, buffer_s16);
        var _ima_index = buffer_read(_buffer, buffer_s16);
        var _xscale = buffer_read(_buffer, buffer_s8);
        
        ds_list_add(_active_players, _sock);
        
        if (!ds_map_exists(ds_jogadores, _sock)){
            var _obj = instance_create_depth(_xx, _yy, 0, obj_render_player);
            _obj.sprite_index = _spr_index;
            _obj.image_index = _ima_index;
            _obj.image_xscale = _xscale;
            ds_map_add(ds_jogadores, _sock, _obj);
        }else{
            var _obj = ds_jogadores[? _sock];
            _obj.x = _xx;
            _obj.y = _yy;
            _obj.sprite_index = _spr_index;
            _obj.image_index = _ima_index;
            _obj.image_xscale = _xscale;
        }
    }
    
    var _keys = ds_map_find_first(ds_jogadores);
    while (!is_undefined(_keys)) {
        if (ds_list_find_index(_active_players, _keys) == -1) {
            instance_destroy(ds_jogadores[? _keys]);
            ds_map_delete(ds_jogadores, _keys);
        }
        _keys = ds_map_find_next(ds_jogadores, _keys);
    }
    
    ds_list_destroy(_active_players);
}