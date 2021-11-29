resource "aws_instance" "myec2" {
  ami           = "ami-09d4a659cdd8677be"
  instance_type = "t2.micro"

  tags = {
    Name = "Mo"
  }
}
