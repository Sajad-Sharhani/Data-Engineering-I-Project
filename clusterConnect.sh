ssh -i Group1.pem \
 -L 9870:192.168.2.241:30070 \
 -L 9000:192.168.2.241:30090 \
 -L 8080:192.168.2.241:30080 \
 -L 4040:192.168.2.241:30040 \
 -L 8888:192.168.2.129:30088 \
 ubuntu@130.238.28.179