# resource "aws_instance" "Terraform" {
#     ami = "ami-060f2cb962e997969"
#     instance_type = "t2.micro"
#     tags = {
#       Name="Testing-keygen"
#     }
# }
# resource "aws_vpc" "main" {
#   cidr_block       = var.cidr_block
#   instance_tenancy = var.instance_tenancy
#   enable_dns_support = var.enable_dns_support
#   enable_dns_hostnames = var.enable_dns_hostnames

#   tags = var.tags
# }

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow all traffic"
  vpc_id      = "vpc-03de4cd13fa0ae0ed"

  ingress {
    description = "TLS from vpc"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
}
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name="allow_tls"
  }
}

resource "aws_key_pair" "terraform_connect" {
  key_name   = "terraform"
  public_key = file("c:\\users\\jagad\\downloads\\terraform_connect.pub")
  # it will assign the pem file to the aws ec2 instance such that we can connect to the ec2 instance
  
}

resource "aws_instance" "connecting" {
    key_name = aws_key_pair.terraform_connect.key_name
    ami = "ami-013e83f579886baeb"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.allow_tls.name]
    tags = {
      Name="Testing-keygen" 
    }
}