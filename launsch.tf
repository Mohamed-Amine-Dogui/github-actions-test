resource "aws_launch_configuration" "web" {
  name_prefix = "web-"

  image_id      = "ami-09d4a659cdd8677be" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"
  key_name      = "momoLaunch"


  security_groups             = [aws_security_group.demo_SG.id]
  associate_public_ip_address = true

  user_data = file("script.sh")


  lifecycle {
    create_before_destroy = true
  }
}