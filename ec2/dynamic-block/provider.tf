terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  #this s3 bucket use to store in remote and dynamodb use to locking machanism
  backend "s3" {
    bucket = "maheswara"
    key    = "dynamic-demo"
    region = "us-east-1"
    dynamodb_table="maheswara-locking"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}