resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = var.tags
}

#security group for postgress rds, 5432
resource "aws_security_group" "allow_postgress" {
  name        = "allow_postgress"
  description = "Allow postgress inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from vpc"
    from_port        = var.postgress_port
    to_port          = var.postgress_port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_list
}
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.tags
}

resource "aws_instance" "Terraform" {
    count = 3
    ami = "ami-060f2cb962e997969"
    instance_type = "t2.micro"
    tags = {
        Name = var.instance_names[count.index]
    }
}

resource "aws_instance" "example" {
    ami = "ami-060f2cb962e997969"
    instance_type = var.condition ? "t3.large" : "t2.micro"
    # here is var.condition is true then create t3.large else create t2.micro
}

resource "aws_instance" "example1" {
    ami = "ami-060f2cb962e997969"
    instance_type = var.condition1 == "PROD" ? "t2.micro" : "t3.large"
    # here is var.condition1 is PROD then create t3.large else create t2.micro
}

resource "aws_key_pair" "terraform" {
  key_name   = "terraform"
  public_key = file("c:\\users\\jagad\\downloads\\terraform.pub")
  # it will assign the pem file to the aws ec2 instance such that we can connect to the ec2 instance
}