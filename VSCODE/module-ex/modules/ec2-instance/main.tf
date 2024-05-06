resource "aws_instance" "module-ex" {
    ami = var.ami_value
    instance_type = var.instance_type_value
}