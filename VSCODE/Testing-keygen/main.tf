# resource "aws_instance" "Terraform" {
#     ami = "ami-060f2cb962e997969"
#     instance_type = "t2.micro"
#     tags = {
#       Name="Testing-keygen"
#     }
# }

resource "aws_key_pair" "terraform" {
  key_name   = "terraform"
  public_key = file("c:\\users\\jagad\\downloads\\terraform.pub")
  # it will assign the pem file to the aws ec2 instance such that we can connect to the ec2 instance
  
}

resource "aws_instance" "condition" {
    key_name = aws_key_pair.terraform.key_name
    ami = "ami-060f2cb962e997969"
    instance_type = "t2.micro"
    tags = {
      Name="Testing-keygen"
    }
}