# vxlan

Very simple overlay network provider designed as docker container.

**Usage**

```
docker run -d \
  --net=host \
  --privileged=true \
  --restart=always \
  -e VIP=192.168.10.1/24 \
  -e VNI=10 \
  -e IF=eth1 \
  -e "HOSTS=123.45.67.89,123.45.67.90" \
  s21g/vxlan
```

 * The container will add `vxlan10` interface linked with `eth1`
 * and add routes to HOSTS (comma separated global IPs)
 
And you need to 

 * run containers for each hosts varying `VIP` (ex "192.168.10.2", ...)
 * make UDP port 8472 accessible between each hosts

Environment variables:

 * VIP: *mandatory parameter* `<ip>/<prefix>[,<ip>/<prefix>,...]`
 * VNI='10'
 * VXLAN="vxlan$VNI"
 * IF="eth0"
 * HOSTS=""
 * PORT=${PORT:="0"}: `0` means to use default port 8472/udp
