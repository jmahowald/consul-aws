This repository contains some automation for some opinioned ways 
of doing service discovery with load balancing.  It is based off consul
and traefik.

There is also terraform to create consul in an aws autoscaling group
and a slighly modified image of consul that can use the associated load
balancer to solve the bootstrap problem, by delegating it to route53. 
This is based off an excellent post on [autoscaling consul](# https://limecodeblog.wordpress.com/2016/09/19/consul-cluster-in-aws-with-auto-scaling/
).

There are also two docker ocmpose projects

both using [traefik](https://traefik.io/) to provide a front end to docker services so that you can use port 80 with logical names.

The Dockerfile contained in here
will start consul as an agent and join 
either the environment variable of 
`CONSUL_SERVER_IP`  or will look up a 
server from the value of `CONSUL_HTTP_URL`
which should be of the form `consul.mycommpany:8500`
