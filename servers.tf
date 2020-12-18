resource "aws_instance" "test-ec2-instance" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  key_name               = var.ami_key_pair_name
  vpc_security_group_ids = ["${aws_security_group.ingress-all-test.id}"]
  tags = {
    Name = var.ami_name
  }
  subnet_id = aws_subnet.subnet-uno.id
}