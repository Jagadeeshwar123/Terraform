# resource "aws_instance" "Terraform" {
#     ami = "ami-060f2cb962e997969"
#     instance_type = "t2.micro"
#     tags = {
#       Name="Testing-keygen"
#     }
# }

resource "aws_key_pair" "terraform_connect" {
  key_name   = "terraform"
  public_key = file("c:\\users\\jagad\\downloads\\terraform_connect.pub")
  # it will assign the pem file to the aws ec2 instance such that we can connect to the ec2 instance
  
}

resource "aws_instance" "connecting" {
    key_name = aws_key_pair.terraform_connect.key_name
    ami = "ami-0f58b397bc5c1f2e8"
    instance_type = "t2.micro"
    tags = {
      Name="Testing-keygen" 
    }
}