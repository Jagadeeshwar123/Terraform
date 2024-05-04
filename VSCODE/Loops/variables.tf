variable "public_subnet_cidr" {
    type = list
    default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "project_name" {
    type = string
    default = "Loop"
  
}

variable "az" {
    type = list 
    default = ["ap-south-1a","ap-south-1b"]     
}

variable "public_subnet_names" {
    type=list
    default = ["public_1a","public_1b"]
}