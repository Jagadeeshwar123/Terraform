variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
    # description = "This is the project name"
  
}

variable "instance_tenancy" {
    type = string
    default = "default"
    # description = "This is the project name"
  
}

  variable "enable_dns_support" {
    type = bool
    default = "true"
    # description = "This is the project name"
  
}

variable "enable_dns_hostnames" {
    type = bool
    default = "true"
    # description = "This is the project name"
  
}

variable "tags" {
    type = map(string)
    default = {
      "Name" = "test-vpc"
      Terraform=true
      Environment="DEV"
    }
}

variable "postgress_port" {
    type=number
    default=5432 
}

variable "cidr_list" {
    type = list
    default =["10.0.1.0/24","10.0.2.0/24"]   
}

variable "instance_names" {
    type = list
    default = ["web-server","app-server","dbserver"]
}

variable "condition" {
    type = bool
    default = false
}

variable "condition1" {
    type = string
    default = "PROD"
}