resource "aws_security_group" "demo_elb_SG" {
  name        = "demo_elb_SG"
  description = "Allow HTTP traffic to instances through Elastic Load Balancer"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow HTTP through ELB Security Group"
  }
}





resource "aws_elb" "demo_elb" {
  name            = "demoelb"
  security_groups = [aws_security_group.demo_elb_SG.id]
  subnets = [
    aws_subnet.public_subnet_eu_west_1a.id,
    aws_subnet.public_subnet_eu_west_1b.id
  ]

  cross_zone_load_balancing = true

  tags = {
    Name = "demo_app_lb"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:80/"
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }

}

output "elb_dns_name" {
  value = aws_elb.demo_elb.dns_name
}
