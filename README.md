# Ubuntu 16.04 Docker base image    
===    

####  A demonstration of building and vulnerability scanning an OS Base Docker image

Using an older version - not patched - of Ubuntu 16.04 with a shell.

The idea with this image is to push it into GCR Google Cloud Repository where the vulnerability management scanner can function.

Container Analysis provides vulnerability information for the container images in Container Registry.

This page describes how to view, filter, and get notifications on vulnerabilities for the images in Container Registry.

https://cloud.google.com/container-registry/docs/get-image-vulnerabilities

How to also run tcpdump, create a network, an nginx container … and run some traffic - https://medium.com/@xxradar/how-to-tcpdump-effectively-in-docker-2ed0a09b5406

$ docker network create demo-net

$ docker run -d --network demo-net --name wwwnginx nginx

$ docker run -it --network demo-net dockersec/siege -c 1 http://wwwnginx/

Now open a new shell and link the TCPdump container

$ docker run -it --net=container:wwwnginx tcpdump

or if you want to specify tcpdump flags and filters

$ docker run -it --net=container:wwwnginx tcpdump tcpdump port 80

14:38:05.095483 IP 86fde53b1869.80 > 08f18be305e8.demo-net.41274: Flags [F.], seq 846, ack 149, win 235, options [nop,nop,TS val 2062442 ecr 2062442], length 0
14:38:05.095564 IP 08f18be305e8.demo-net.41274 > 86fde53b1869.80: Flags [F.], seq 149, ack 847, win 247, options [nop,nop,TS val 2062442 ecr 2062442], length 0
14:38:05.095607 IP 86fde53b1869.80 > 08f18be305e8.demo-net.41274: Flags [.], ack 150, win 235, options [nop,nop,TS val 2062442 ecr 2062442], length 0
14:38:06.097784 IP 08f18be305e8.demo-net.41276 > 86fde53b1869.80: Flags [S], seq 2606688608, win 29200, options [mss 1460,sackOK,TS val 2062543 ecr 0,nop,wscale 7], length 0
14:38:06.097846 IP
