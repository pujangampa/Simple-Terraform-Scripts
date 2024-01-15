provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "tf_security_group" {
  name        = "tf-security-group"
  description = "Allow inbound SSH and TCP traffic" 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "tf_instance" {
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.micro"
  key_name               = "tf-login"
  vpc_security_group_ids = [aws_security_group.tf_security_group.id]

  tags = {
    Name = "tf=project"
  }
}
