resource "aws_instance" "Terraform" {
    ami = "ami-060f2cb962e997969"
    instance_type = "t2.micro"
}