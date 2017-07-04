import socket
import time
import sys
ip_udp = "0.0.0.0" # for vlp-16 lidar it is
port_udp = 2368
sock_udp = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
sock_udp.bind((ip_udp,port_udp))
ip_tcp = "enter your ip here(global IP preffered)"
port_tcp = 17000
sock_tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock_tcp.bind((ip_tcp,port_tcp))
sock_tcp.listen(5)
(client, (ip,port)) = sock_tcp.accept()


while 1:
    data = sock_udp.recv(1248)
    client.send(data)

    


    
