tcp = network_create_socket(network_socket_tcp);
socket = network_connect(tcp, "127.0.0.1", 25555);

buff = buffer_create(1024,buffer_grow,1)