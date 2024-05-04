terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.47.0"
    }
  }

# backend "s3"{
#   bucket = "terraform-ex"
#   key = "loops"
#   region = "ap-south-1"
#   dynamodb_table = "terraform-lock"
# }
}

provider "aws" {
  region = "ap-south-1"
}