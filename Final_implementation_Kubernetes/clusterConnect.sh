#!/usr/bin/env bash

# script to ssh to driver node with ssh port forwarding of all relevant exposed ports within the cluster
# after using this script, webGUIs will be reachable at localhost ports 8888 (jupyter notebook), 9870 (HDFS webGUI),
# 8080 (Spark webGUI), and 4040 (Spark driver webGUI).

ssh -i Group1.pem \
 -L 9870:192.168.2.241:30070 \
 -L 8080:192.168.2.241:30080 \
 -L 4040:192.168.2.241:30040 \
 -L 8888:192.168.2.129:30088 \
 ubuntu@130.238.28.179
