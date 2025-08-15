buffer_seek(buff,buffer_seek_start,0)
buffer_write(buff,buffer_string,"atualizar_player");
buffer_write(buff,buffer_s32,obj_player.x);
buffer_write(buff,buffer_s32,obj_player.y);
buffer_write(buff,buffer_s32,obj_player.sprite_index);
buffer_write(buff,buffer_s32,obj_player.image_index);
buffer_write(buff,buffer_s32,obj_player.image_xscale);
network_send_packet(tcp, buff, buffer_tell(buff))