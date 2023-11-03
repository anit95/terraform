provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_security_group" "TF_SG" {
    name = "security group using terraform"
    description = "security group using terraform"
    vpc_id = "vpc-06f34c308f2003edd"

   ingress {
    description = "TLS from vpc"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]


    }
   ingress {
    description = "Http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]


    }
   ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]


    }
       ingress {
    description = " Jenkins "
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]


    }
      egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "TF_SG"
  } 
}

resource "aws_instance" "example" {
  ami           = var.ami_value
  instance_type = var.instance_type
  security_groups = [aws_security_group.TF_SG.name]
  key_name      = "DevOps"  # Specify the key pair name here
  user_data = file("script.sh")
  
  
}