tcp_socket = network_create_socket(network_socket_tcp);
network_connect(tcp_socket, "127.0.0.1", 25555);

buff = buffer_create(1024, buffer_grow, 1);
ds_jogadores = ds_map_create();

server = network_create_server(network_socket_tcp, 25555, 3);
ds_clients = ds_map_create();