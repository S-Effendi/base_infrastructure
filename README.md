# base_infrastructure
This repository contains sample code which can be used to build the below AWS infrastructure.

•	A VPC with a CIDR 10.0.0.0/16
•	3 subnets within the VPC in 2 different AZs, one should be a private subnet, a public subnet, and a data subnet.
•	A load balancer of your choice with ports 80 and 443 exposed and a public IP attached
•	A domain for the load balancer in a Private Route 53 Zone
•	Get an SSL cert for the domain to apply to the ELB. 
•	An EC2 instance with Nginx installed (automatically), in the private subnet, which is reachable through the load balancer.
