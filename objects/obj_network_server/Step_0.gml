for (var _i = ds_map_find_first(ds_clients); !is_undefined(_i); _i = ds_map_find_next(ds_clients, _i)) {
    var _client_sock = _i;
    var _client_inst = ds_clients[? _client_sock];
    
    if (instance_exists(_client_inst)) {
        buffer_seek(buff, buffer_seek_start, 0);
        buffer_write(buff, buffer_string, "Send_Client");
        buffer_write(buff, buffer_s16, instance_number(obj_player) - 1);

        with (obj_player) {
            if (id != _client_inst.id)
			{
                buffer_write(other.buff, buffer_s16, sock);
                buffer_write(other.buff, buffer_s16, x);
                buffer_write(other.buff, buffer_s16, y);
                buffer_write(other.buff, buffer_s16, sprite_index);
                buffer_write(other.buff, buffer_s16, image_index);
                buffer_write(other.buff, buffer_s8, image_xscale);
            }
        }
        network_send_packet(_client_sock, buff, buffer_tell(buff));
    }else{ds_map_delete(ds_clients, _client_sock);}
}