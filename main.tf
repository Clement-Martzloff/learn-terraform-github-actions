terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  backend "remote" {
    organization = "clement-martzloff"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0bd39c806c2335b95"
  instance_type = "t2.micro"
  user_data     = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}

output "web-address" {
  value = "${aws_instance.web.public_dns}:8080"
}
