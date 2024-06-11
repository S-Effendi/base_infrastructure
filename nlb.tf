#3 Create Network Load Balancer (NLB)
resource "aws_lb" "nlb" {
  name                  = "this-nlb"
  load_balancer_type    = "network"
  subnets               = [
    aws_subnet.public.id,
    aws_subnet.private.id,
    aws_subnet.data.id
  ]

  internal                          = false
  enable_cross_zone_load_balancing  = true
  enable_deletion_protection        = false

  tags = {
    Name = "this-nlb"
  }
}  

#3 Assign an Elastic IP (EIP)
resource "aws_eip" "eip" {
  vpc = true
}

#3 Create NLB Target Group
resource "aws_lb_target_group" "tg" {
  name     = "this-target-group"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.vpc.id
}

#3 Create NLB Listeners
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 443
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
