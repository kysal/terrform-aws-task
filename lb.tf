resource "aws_lb" "load_balancer" {
  name = "kyle-nlb-terraform"
  internal = false
  load_balancer_type = "network"
  subnets = [ 
    "subnet-0b9a0a0d81a9e9a11",
    "subnet-03fc2475c68b57df6",
    "subnet-049bc4534aa922545"
   ]
}

resource "aws_lb_target_group" "lb_group" {
  name = "kyle-lb-tg"
  vpc_id = "vpc-033261a13b736a250"

  port = 80
  protocol = "TCP"

}

resource "aws_lb_target_group_attachment" "server_1_lb_group_attachment" {
  target_group_arn = aws_lb_target_group.lb_group.arn
  target_id = aws_instance.server_1.id
  port = 80
}

resource "aws_lb_target_group_attachment" "server_2_lb_group_attachment" {
  target_group_arn = aws_lb_target_group.lb_group.arn
  target_id = aws_instance.server_2.id
  port = 80
}

resource "aws_lb_target_group_attachment" "server_3_lb_group_attachment" {
  target_group_arn = aws_lb_target_group.lb_group.arn
  target_id = aws_instance.server_3.id
  port = 80
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port = 80
  protocol = "TCP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb_group.arn
  }
}