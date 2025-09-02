server = network_create_server(network_socket_tcp,25555,3);

ds_clients = ds_map_create();
buff = buffer_create(1024,buffer_grow,1);
_obj = noone;