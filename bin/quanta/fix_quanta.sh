#!/bin/sh

case "$1" in 
start)
#sudo route delete default
#sudo route add -host 211.76.240.4 140.113.200.190
echo " Add Route"
x=0
while [ $x -lt 300 ]
do
x=` echo "$x+1" | bc `
done
#route add default 211.76.240.3
echo VPN start...
;;
*)
echo "Usage : ^ Basename $0 {start|stop}" >&2
esac
