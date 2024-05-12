terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.47.0"
    }
  }

backend "s3"{
  bucket = "infra-ex"
  key = "infra"
  region = "ap-south-1"
  dynamodb_table = "infra-lock"
}
}

provider "aws" {
  region = "ap-south-1"
}